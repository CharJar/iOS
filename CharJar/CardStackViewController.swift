//
//  CardStackViewController.swift
//  CharJar
//
//  Created by Mary Gezo on 5/9/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import UIKit

class CardStackViewController: UIViewController {
	var projectStack: Array<Project> = Array<Project>()
	var cardStack: Array<CardView> = Array<CardView>()
	var mainCardFrame = CGRect()
	
	@IBOutlet weak var topCard: CardView!
	@IBOutlet weak var viewFooter: UIView!
	
	@IBOutlet weak var viewMiddle: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		// Set Background Image
		var backgroundImg = UIImageView(image: UIImage(named: "BG_main"))
		backgroundImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
		backgroundImg.contentMode = UIViewContentMode.ScaleAspectFit	// Problems with iPhone4?
		self.view.insertSubview(backgroundImg, atIndex: 0)


		// 1. REST call to get all the nearby projects, update projectStack
		projectStack = Services.getProjects("32", count: 4)
		
		// 2. Immediately fill in the top/first CardView for viewing ?
		topCard.lblProjectName.text = projectStack[0].name //"Puppy Shelter for a Month"
		topCard.lblOrganizationName.text = "" //"By: Austin Pets Alive!"
		topCard.lblProjectDetails.text = projectStack[0].description
		
		//"We want to buy food for over 300 dogs and cats , will last over a month, and will do a bunch of other exciting things that save the lives of many adorable puppies."
		topCard.imgProjectMedia.image = UIImage(named: "puppy")
		cardStack.append(topCard)
		
		mainCardFrame = topCard.frame
		
		for (proj: Project) in projectStack {
			cardStack.append(createCardView(proj))
		}
		cardStack.removeAtIndex(0)	// Remove 1st, since that was already pushed on as "topCard"
    }
	

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
	
	func createCardView(project: Project) -> CardView! {
		var newCard: CardView! = nil
		
		var topFrame = CGRect(
			x: mainCardFrame.origin.x,
			y: mainCardFrame.origin.y - mainCardFrame.height - 20,
			width: mainCardFrame.width,
			height: mainCardFrame.height)
		newCard = CardView(frame: topFrame)
		newCard.lblProjectName.text = project.name//"Dental Care for 3rd World"
		newCard.lblOrganizationName.text = ""//"By: Medico"
		newCard.lblProjectDetails.text = project.description// "We want to buy 2 new dental units that will enable us to give proper dental care to villages in the 3rd world."
		let data = NSData(contentsOfURL: NSURL(string: "http://charjar.me/images/\(project.media)")!)
		newCard.imgProjectMedia.image = UIImage(data: data!)
		cardStack.append(newCard)
		
		return newCard
	}
    
	@IBAction func swipeRight_touch(sender: UISwipeGestureRecognizer) {
		// 2. Process money & related stuff >.>
		
		// 3. Execute transition animation
		let transitionOptions = UIViewAnimationOptions.CurveEaseIn
		UIView.transitionWithView(self.cardStack[0], duration: 0.5, options: transitionOptions, animations: {
			var finalFrame = CGRect(
				x: self.view.frame.width,
				y: self.view.frame.origin.y,
				width: self.mainCardFrame.width,
				height: self.mainCardFrame.height)
			
			var topCard: CardView = self.viewMiddle.subviews[0] as! CardView
			topCard.frame = finalFrame

		}, completion: { finished in
			
			for view in self.viewMiddle.subviews {
				view.removeFromSuperview()
			}
			
			self.cardStack.removeAtIndex(0)
			
			// Adding new "index 0" card
			self.viewMiddle.addSubview(self.cardStack[0])
			
			var tempMainCardFrame = CGRect(x: self.mainCardFrame.origin.x - 25, y: self.mainCardFrame.origin.y - 65, width: self.mainCardFrame.width * 0.5, height: self.mainCardFrame.height)
			
			UIView.transitionWithView(self.cardStack[0], duration: 0.5, options: transitionOptions, animations: {
				// Move in the next card from the top
				self.cardStack[0].frame = tempMainCardFrame
			}, completion: { finished in
				//println("new card transitioned in")
			})
		})
	}

	@IBAction func swipeLeft_touch(sender: UISwipeGestureRecognizer) {
		// 1. Create next card
		let transitionOptions = UIViewAnimationOptions.CurveEaseIn
		var curFrame = self.cardStack[0].frame
		UIView.transitionWithView(cardStack[0], duration: 0.5, options: transitionOptions, animations: {
			var finalFrame = CGRect(
				x: self.view.frame.width - self.mainCardFrame.width * 2,
				y: self.view.frame.origin.y,
				width: self.mainCardFrame.width,
				height: self.mainCardFrame.height)
			
			var topCard: CardView = self.viewMiddle.subviews[0] as! CardView
			topCard.frame = finalFrame
			
		}, completion: { finished in
		
			for view in self.viewMiddle.subviews {
				view.removeFromSuperview()
			}
			var topCard = self.cardStack.removeAtIndex(0)
			
			self.cardStack[0].frame = self.mainCardFrame
			self.viewMiddle.addSubview(topCard)
			
			// Drop in new card
			UIView.transitionWithView(self.cardStack[0], duration: 0.5, options: transitionOptions, animations: {
				// Move in the next card from the top
				self.cardStack[0].frame = curFrame
			}, completion: { finished in
				//println("new card transitioned in")
			})
		
		})
		
		
	}
	
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
