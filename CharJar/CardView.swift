//
//  CardView.swift
//  CharJar
//
//  Created by Mary Gezo on 5/9/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import UIKit

class CardView: UIView {
	@IBOutlet weak var imgProjectMedia: UIImageView!
	@IBOutlet weak var imgProjectType: UIImageView!
	
	@IBOutlet weak var lblProjectName: UILabel!
	@IBOutlet weak var lblOrganizationName: UILabel!
	@IBOutlet weak var lblProjectDetails: UILabel!
	
	@IBOutlet var view: UIView!
	
	var isProject = true	// Card defaults to "project" view, as opposed to "organization" view
	var projectIdx = 0		// This should always match the projectStack array index
	
	required init(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)
		self.addSubview(self.view)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		NSBundle.mainBundle().loadNibNamed("CardView", owner: self, options: nil)
		self.addSubview(self.view)
	}
	
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
