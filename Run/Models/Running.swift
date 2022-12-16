//
//  Running.swift
//  Run
//
//  Created by unicred on 14/12/22.
//

import Foundation

class Running: NSObject {
	let name: String
	let start: Date
	let end: Date

	let df: DateFormatter = {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy, HH:mm:ss"
		return dateFormatter
	}()
	
	init(name: String, start: String, end: String) {
		self.name = name
		self.start = df.date(from: start)!
		self.end = df.date(from: end)!
	}
	
	func elapsed() -> Int {
		let elapsed = end.timeIntervalSinceReferenceDate - start.timeIntervalSinceReferenceDate
		return Int(elapsed)
	}
}
