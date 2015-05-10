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
		
		// Have a loading wheel of some sort...?
		
		// 1. REST call to get all the nearby projects, update projectStack
		projectStack = Services.getProjects("32", count: 2)
		
		// 2. Immediately fill in the top/first CardView for viewing ?
		topCard.lblProjectName.text = projectStack[0].description //"Puppy Shelter for a Month"
		topCard.lblOrganizationName.text = projectStack[0].name //"By: Austin Pets Alive!"
		topCard.lblProjectDetails.text = projectStack[0].description //"We want to buy food for over 300 dogs and cats , will last over a month, and will do a bunch of other exciting things that save the lives of many adorable puppies."
		topCard.imgProjectMedia.image = UIImage(named: "puppy")
		
		// We need this for later!
		mainCardFrame = topCard.frame
		
		for (proj: Project) in projectStack {
			cardStack.append(createCardView(proj))
		}
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
		newCard.lblProjectName.text = "Dental Care for 3rd World"
		newCard.lblOrganizationName.text = "By: Medico"
		newCard.lblProjectDetails.text = "We want to buy 2 new dental units that will enable us to give proper dental care to villages in the 3rd world."
		newCard.imgProjectMedia.image = UIImage(named: "puppy")
		cardStack.append(newCard)
		
		return newCard
	}
    
	@IBAction func swipeRight_touch(sender: UISwipeGestureRecognizer) {
		//println("Swipin' right!")
//		var topFrame = CGRect(
//			x: topCard.frame.origin.x,
//			y: topCard.frame.origin.y - topCard.frame.height - 20,
//			width: topCard.frame.width,
//			height: topCard.frame.height)
//		// 1. Create next card
//		//var nextCard = createCardView(projectStack[1])
//		var newCard = CardView(frame: topFrame)
//		newCard.lblProjectName.text = "Dental Care for 3rd World"
//		newCard.lblOrganizationName.text = "By: Medico"
//		newCard.lblProjectDetails.text = "We want to buy 2 new dental units that will enable us to give proper dental care to villages in the 3rd world."
//		newCard.imgProjectMedia.image = UIImage(named: "puppy")
//		cardStack.append(newCard)
//		self.view.insertSubview(newCard, belowSubview: topCard)
//		cardStack.append(newCard)
		
		// 2. Process money & related stuff >.>
		
		// 3. Execute transition animation
		let transitionOptions = UIViewAnimationOptions.CurveEaseIn
		UIView.transitionWithView(self.cardStack[0], duration: 0.5, options: transitionOptions, animations: {
			var finalFrame = CGRect(
				x: self.view.frame.width,
				y: self.view.frame.origin.y,
				width: self.mainCardFrame.width,
				height: self.mainCardFrame.height)
			
			self.cardStack[0].frame = finalFrame
			
		}, completion: { finished in
			// Create new card
			// "Pop" off top card & remove it completely from the view & array
			// Transition in the new card
//			var topFrame = CGRect(
//				x: self.mainCardFrame.origin.x,
//				y: self.mainCardFrame.origin.y - self.mainCardFrame.height - 20,
//				width: self.mainCardFrame.width,
//				height: self.mainCardFrame.height)
//			var newCard = CardView(frame: topFrame)
//			newCard.lblProjectName.text = "Dental Care for 3rd World"
//			newCard.lblOrganizationName.text = "By: Medico"
//			newCard.lblProjectDetails.text = "We want to buy 2 new dental units that will enable us to give proper dental care to villages in the 3rd world."
//			newCard.imgProjectMedia.image = UIImage(named: "puppy")

			
			//self.cardStack.append(newCard)
			//self.scrollView.addSubview(newCard)//insertSubview(newCard, belowSubview: self.cardStack[0])
			
			//println("removing item")
			self.cardStack[0].removeFromSuperview()
			self.cardStack.removeAtIndex(0)
			
			// Adding new "index 0" card
			self.viewMiddle.addSubview(self.cardStack[0])
			
//			UIView.transitionWithView(self.cardStack[0], duration: 0.5, options: transitionOptions, animations: {
//				// Move in the next card from the top
//				self.cardStack[0].frame = self.mainCardFrame
//			}, completion: { finished in
//				//println("new card transitioned in")
//			})

			
		})
	}

	@IBAction func swipeLeft_touch(sender: UISwipeGestureRecognizer) {
		println("Swipin' left!")
		// 1. Create next card
		let transitionOptions = UIViewAnimationOptions.CurveEaseIn
		let transOptions = UIViewAnimationOptions.CurveLinear
		var curFrame = self.cardStack[0].frame
		UIView.transitionWithView(cardStack[0], duration: 0.5, options: transitionOptions, animations: {
			var finalFrame = CGRect(
				x: self.view.frame.width - self.mainCardFrame.width * 2,
				y: self.view.frame.origin.y,
				width: self.mainCardFrame.width,
				height: self.mainCardFrame.height)
			
			self.cardStack[0].frame = finalFrame
			
		}, completion: { finished in
		
			var topFrame = CGRect(
				x: self.mainCardFrame.origin.x,
				y: self.mainCardFrame.origin.y - self.mainCardFrame.height - 20,
				width: self.mainCardFrame.width,
				height: self.mainCardFrame.height)
			var newCard = CardView(frame: topFrame)
			newCard.lblProjectName.text = "Dental Care for 3rd World"
			newCard.lblOrganizationName.text = "By: Medico"
			newCard.lblProjectDetails.text = "We want to buy 2 new dental units that will enable us to give proper dental care to villages in the 3rd world."
			newCard.imgProjectMedia.image = UIImage(named: "puppy")
		
			// Drop in new card
			UIView.transitionWithView(newCard, duration: 0.5, options: transOptions, animations: {
				// Move in the next card from the top
				newCard.frame = curFrame
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
