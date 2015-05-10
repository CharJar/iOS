//
//  Donation.swift
//  CharJar
//
//  Created by Mary Gezo on 5/10/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import Foundation

class Donation {
	var id: Int		// Anderw will set this uuid
	var user_id: Int
	var project_id: Int
	var amount: Double
	var time: String
	var paymentMethod: String
	
	init(user_id: Int, project_id: Int, amount: Double, time: String) {
		self.id = 0
		self.user_id = user_id
		self.project_id = project_id
		self.amount = amount
		self.time = time
		
		self.paymentMethod = ""
	}

}