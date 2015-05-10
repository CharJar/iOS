//
//  Project.swift
//  CharJar
//
//  Created by Mary Gezo on 5/9/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import Foundation

class Project {
	var id: String
	var name: String
	var startDate: String
	var endDate: String
	var goalAmount: Double
	var totalAmountToDate: Double
	var description: String
	//var organization: Organization
	var media: String
	
	init(id: String, name: String, startDate: String, endDate: String, goalAmount: Double, totalAmountToDate: Double, description: String, media: String) {
		self.id = id
		self.name = name
		self.startDate = startDate
		self.endDate = endDate
		self.goalAmount = goalAmount
		self.totalAmountToDate = totalAmountToDate
		self.description = description
		//self.organization = organization
		self.media = media
	}

}