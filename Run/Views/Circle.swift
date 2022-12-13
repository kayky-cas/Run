//
//  Circle.swift
//  Run
//
//  Created by unicred on 13/12/22.
//

import UIKit

class Circle: UIView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

    override func draw(_ rect: CGRect) {
		
		layer.cornerRadius = frame.height / 2
		layer.masksToBounds = true
		layer.backgroundColor = UIColor.white.cgColor
		
	}
}