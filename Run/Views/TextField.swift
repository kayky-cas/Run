//
//  PinkTextField.swift
//  OhMeuDeusQuantasTelas
//
//  Created by unicred on 08/12/22.
//

import UIKit

class TextField: UITextField {

	/*
	// Only override draw() if you perform custom drawing.
	// An empty implementation adversely affects performance during animation.
	override func draw(_ rect: CGRect) {
		// Drawing code
	}
	*/

	override func draw(_ rect: CGRect) {
		// Drawing code
		self.layer.cornerRadius = 15
		self.layer.borderColor = UIColor.white.cgColor
		self.layer.borderWidth = 2
		self.textAlignment = .center
		textColor = .white
		font = UIFont.boldSystemFont(ofSize: 20)
		
		self.autocorrectionType = .no
		self.tintColor = .white
	}
}
