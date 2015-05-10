//
//  Organization.swift
//  CharJar
//
//  Created by Mary Gezo on 5/9/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import Foundation

class Organization {
	var id: Int
	var name: String
	var missionStatement: String
	var email: String
	var type: OrgType
	var bankInfo: String
	var description: String
	var nbrProjectsCompleted: Int
	var accountabilityDesc: String
	var isActive: Bool
	
	init (id: Int, name: String, missionStatement: String, email: String, type: Int, description: String, nbrProjectsCompleted: Int, accountabilityDesc: String) {
		self.id = id
		self.name = name
		self.missionStatement = missionStatement
		self.email = email
		self.type = OrgType(rawValue: type)!
		self.bankInfo = ""
		self.description = description
		self.nbrProjectsCompleted = nbrProjectsCompleted
		self.accountabilityDesc = accountabilityDesc
		self.isActive = false
	}
	
	enum OrgType: Int {
		case Emergency = 1, Community, Animals, Medical, Education, Memorials, Sports, Volunteer
	}
}