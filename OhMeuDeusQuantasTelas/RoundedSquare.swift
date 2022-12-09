//
//  RoundedSquare.swift
//  OhMeuDeusQuantasTelas
//
//  Created by unicred on 09/12/22.
//

import UIKit

class RoundedSquare: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func draw(_ rect: CGRect) {
		self.layer.cornerRadius = 20.0
		self.layer.masksToBounds = true
	}
}
