//
//  ViewController.swift
//  CharJar
//
//  Created by Mary Gezo on 5/9/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet weak var imgTutorial: UIImageView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		var backgroundImg = UIImageView(image: UIImage(named: "bg_login"))
		backgroundImg.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
		backgroundImg.contentMode = UIViewContentMode.ScaleAspectFit	// Problems with iPhone4?
		
		self.view.insertSubview(backgroundImg, atIndex: 0)
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

	@IBAction func btnLogin_touch(sender: UIButton) {
		// Perform segue to main screen
		performSegueWithIdentifier("showCardStack", sender: nil)
	}
	
	@IBAction func btnRegister_touch(sender: UIButton) {
		// Perform segue to Register screen (P2?)
	}

}

