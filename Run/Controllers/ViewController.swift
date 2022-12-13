//
//  ViewController.swift
//  Run
//
//  Created by unicred on 13/12/22.
//

import UIKit

class ViewController: UIViewController {
	
	lazy var bottonCircle: Circle = {
		let circle = Circle()
		return circle
	}()
	
	lazy var topCircle: Circle = {
		let circle = Circle()
		return circle
	}()
	
	lazy var logo: LogoView = {
		let image = LogoView()
		return image
	}()
	
	lazy var signUpButton: Button = {
		let button = Button()
		button.titleLabel?.text = "Create an Account"
		return button
	}()
	
	lazy var titleLabel: UILabel = {
		let title = UILabel()
		title.text = "RUN"
		title.textAlignment = .center
		title.font = UIFont.italicSystemFont(ofSize: 60)
		title.textColor = .white
		title.shadowColor = .black
		title.shadowOffset = .init(width: -4, height: 3)
		return title
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.addSubviews(bottonCircle, topCircle, logo, titleLabel, signUpButton)
		setConstraints()
	}
	
	func setConstraints() {
		let bottonCircleWidth = view.frame.width * 1.5
		
		bottonCircle.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: -330, bottom: -330, right: 0), size: .init(width: bottonCircleWidth, height: bottonCircleWidth))
		
		let topCircleSize = view.frame.width * 2
		
		topCircle.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -680, left: 0, bottom: 0, right: -450), size: .init(width: topCircleSize, height: topCircleSize))
		
		logo.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 50, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 200))
		
		logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		titleLabel.anchor(top: logo.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 0, left: 0, bottom: 0, right: 0), size: .init(width: 200, height: 100))
		
		titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		signUpButton.anchor(top: nil, leading: nil, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: 50, right: 0), size: .init(width: 100, height: 100))
		
		signUpButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
}

