//
//  User.swift
//  CharJar
//
//  Created by Mary Gezo on 5/9/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import Foundation

class User {
	var id: Int
	var fName: String
	var lName: String
	var email: String
	
	init(id: Int, fName: String, lName: String, email: String) {
		self.id = id
		self.fName = fName
		self.lName = lName
		self.email = email
	}
}