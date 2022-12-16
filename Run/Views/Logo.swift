//
//  LogoView.swift
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
	
	init() {
		super.init(image: UIImage(systemName: "figure.highintensity.intervaltraining"))
		self.tintColor = .white
		self.contentMode = .scaleAspectFit
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
