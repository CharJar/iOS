//
//  Date.swift
//  CharJar
//
//  Created by Mary Gezo on 5/10/15.
//  Copyright (c) 2015 CharJar. All rights reserved.
//

import Foundation

class Date {

	// # - A reminder that this parameter is an int
	// Convert Year/Month/Day ints to NSDate
	class func from (#year: Int, month: Int, day: Int) -> NSDate {
		
		var components = NSDateComponents()
		components.year = year
		components.month = month
		components.day = day
		
		// Must specify the calendar type before being able to make a date
		var gregorian = NSCalendar(identifier: NSGregorianCalendar)
		var date = gregorian?.dateFromComponents(components)
		
		return date!
	}
	
	// Convert UTC Date to NSDate
	class func toDate(dateDub: Double) -> NSDate {
		var dateConv = dateDub / 1000		// Unix TS is in millis, so divide to rid yourself of them
		return NSDate(timeIntervalSince1970: NSTimeInterval(dateConv))
	}
	
	class func toString(#date: NSDate) -> String {
		let dateStringFormatter = NSDateFormatter()
		dateStringFormatter.dateFormat = "yyyy-MM-dd"
		
		return dateStringFormatter.stringFromDate(date)
	}

}