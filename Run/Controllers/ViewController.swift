//
//  ViewController.swift
//  Run
//
//  Created by unicred on 13/12/22.
//

import UIKit


class ViewController: UIViewController {
	
	lazy var bottonCircle = Circle()
	lazy var topCircle = Circle()
	
	lazy var logo = Logo()
	
	lazy var board = RunningCollection()
	
	lazy var titleLabel: UILabel = {
		let title = UILabel()

		title.text = "Runnings"
		title.textAlignment = .center
		title.font = UIFont.italicSystemFont(ofSize: 35)
		title.textColor = .white
		
		return title
	}()
	
	lazy var startButton: UIButton = {
		let button = UIButton(configuration: UIButton.Configuration.filled())

		button.setTitle(" Start a race", for: .normal)
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		
		button.layer.borderColor = UIColor.white.cgColor
		button.layer.borderWidth = 2
		button.layer.cornerRadius = 15
		
		button.setImage(UIImage(systemName: "flag.circle.fill"), for: .normal)

		button.tintColor = .systemPink

		button.addTarget(self, action: #selector(openRunningModal), for: .touchUpInside)
		
		return button
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		configView()
	}
	
	func configView() {
		view.addSubviews(startButton, bottonCircle, topCircle, logo, titleLabel, board)
		setConstraints()
	}
	
	func setConstraints() {
		setConstraintsCircles()
		setConstraintsHeader()
		setConstraintsButton()
		setConstraintsBoard()
	}
	
	func setConstraintsCircles() {
		let topCircleSize = view.frame.width * 2
		topCircle.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: view.trailingAnchor, padding: .init(top: -680, left: 0, bottom: 0, right: -450), size: .init(width: topCircleSize, height: topCircleSize))
		
		let bottonCircleWidth = view.frame.width * 1.5
		bottonCircle.anchor(top: nil, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: -330, bottom: -330, right: 0), size: .init(width: bottonCircleWidth, height: bottonCircleWidth))
	}
	
	func setConstraintsHeader() {
		let logoSize = 80
		logo.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0), size: .init(width: logoSize, height: logoSize))
		
		logo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		titleLabel.anchor(top: logo.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: -30, left: 0, bottom: 0, right: 0), size: .init(width: 300, height: 100))
		
		titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	
	func setConstraintsButton() {
		startButton.anchor(top: titleLabel.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: -15, left: 0, bottom: 0, right: 0), size: .init(width: 0, height: 50))
		
		startButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	
	func setConstraintsBoard() {
		board.anchor(top: startButton.bottomAnchor, leading: nil, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width - 20, height: 570))
		
		board.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
	}
	
	@objc func openRunningModal() {
		let main = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let running = main.instantiateViewController(identifier: "RunningViewController") as? RunningViewController else { return }
		
		running.getRunning = { running in
			self.board.pushRunning(running)
			self.board.reloadData()
		}

		present(running, animated: true)
	}
}
