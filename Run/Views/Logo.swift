//
//  Logo.swift
//  Run
//
//  Created by unicred on 13/12/22.
//

import UIKit

class Logo: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
   override func draw(_ rect: CGRect) {
	   image = UIImage(systemName: "figure.run")
	   tintColor = .white
   }
}
