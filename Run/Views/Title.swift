//
//  Title.swift
//  Run
//
//  Created by unicred on 13/12/22.
//

import UIKit

class Title: UILabel {
	override init(frame: CGRect) {
		super.init(frame: frame)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func draw(_ rect: CGRect) {
		backgroundColor = .red
		textColor = .white
		text = "XXXXXXX"
	}
}
