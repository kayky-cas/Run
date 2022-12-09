//
//  PinkTextField.swift
//  OhMeuDeusQuantasTelas
//
//  Created by unicred on 08/12/22.
//

import UIKit

class PinkTextField: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func draw(_ rect: CGRect) {
        // Drawing code
		self.layer.cornerRadius = 5.0
		self.layer.borderColor = UIColor.systemPink.cgColor
		self.layer.borderWidth = 1.5
		
		self.autocorrectionType = .no
		self.tintColor = .systemPink
    }
}
