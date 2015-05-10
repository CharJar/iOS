//
//  Services.swift
//  CharJar
//
//  Created by Mary Gezo on 5/10/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import Foundation

class Services {
	
	static var CJ_URL = "http://charjar.me:8080/CharJar"
	
	class func login(email: String, password: String) -> User! {
		var url = "\(CJ_URL)/login"
		var paramString = "?email=\(email)&password=\(password)"
		var user: User! = nil
		
		var request: NSMutableURLRequest = NSMutableURLRequest()
		request.URL = NSURL(string: url)
		request.HTTPMethod = "POST"
		request.HTTPBody = paramString.dataUsingEncoding(NSUTF8StringEncoding)
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		
		var data: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: NSErrorPointer())
		
		let json = JSON(data: data)
		
		user = User(id: json["id"].intValue, fName: json["fName"].stringValue, lName: json["lName"].stringValue, email: json["email"].stringValue)
		
		return user
	}
	
	class func getProjects(userID: String, count: Int) -> Array<Project>! {
		var paramString = "?userUUID=\(userID)&quantity=\(count)"
		var url = "\(CJ_URL)/projects\(paramString)"
		var projects: Array<Project>! = Array<Project>()
	
		var request: NSMutableURLRequest = NSMutableURLRequest()
		request.URL = NSURL(string: url)
		request.HTTPMethod = "GET"
		request.addValue("application/json", forHTTPHeaderField: "Content-Type")
		
		var response: AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		
		var data: NSData! = NSURLConnection.sendSynchronousRequest(request, returningResponse: response, error: NSErrorPointer())
		
		let json = JSON(data: data)
		for (key: String, subJson: JSON) in json {
			//Do something you want
			var media = subJson["media"][0].stringValue
			
			
			var proj: Project = Project(
				id: subJson["id"].stringValue,
				name: subJson["name"].stringValue,
				startDate: subJson["startDate"].stringValue,
				endDate: subJson["endDate"].stringValue,
				goalAmount: subJson["goal"].doubleValue,
				totalAmountToDate: 0.0,
				description: subJson["description"].stringValue,
				media: media)
			projects.append(proj)
		}
		
		return projects;
	}
	
}