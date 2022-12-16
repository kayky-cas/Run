//
//  RunningViewController.swift
//  Run
//
//  Created by unicred on 15/12/22.
//

import UIKit

class RunningViewController: UIViewController {
	var getRunning: ((Running) -> Void)?
	
	lazy var bottonCircle = Circle()
	lazy var topCircle = Circle()

	var start: Date?
	
	lazy var image: UIImageView = {
		let image = UIImage.gifImageWithName("running")
		let imageView = UIImageView(image: image)
		return imageView
	}()
	
	lazy var timer: UILabel = {
		let label = UILabel()
		label.text = "00:00:01"
		
		label.textColor = .white
		label.font = UIFont.italicSystemFont(ofSize: 60)
		
		return label
	}()
	
	lazy var stopButton: UIButton = {
		let button = UIButton(configuration: UIButton.Configuration.filled())
		
		button.setTitle(" Stop", for: .normal)
		
		button.setImage(UIImage(systemName: "stop.circle"), for: .normal)
		
		button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
		
		button.titleLabel?.textColor = .systemPink
		
		button.addTarget(self, action: #selector(stopCount), for: .touchUpInside)
		
		return button
	}()
	
	lazy var nameInput: TextField = {
		let field = TextField()
		field.text = "New Race"
		return field
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		configView()
		stopWatch()
	}
	
	func configView() {
		view.backgroundColor = .systemPink
		view.addSubviews(bottonCircle, topCircle, stopButton, nameInput, timer, image)
		setConstraints()
	}
	
	func setConstraints() {
		bottonCircle.anchor(top: nil, leading: nil, bottom: view.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 0, bottom: -view.frame.width / 2, right: 0), size: .init(width: view.frame.width, height: view.frame.width))
		topCircle.anchor(top: view.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: -view.frame.width / 2, left: 0, bottom: 0, right: 0), size: .init(width: view.frame.width, height: view.frame.width))
		
		image.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 20, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 150))
		image.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		nameInput.anchor(top: image.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 60, left: 0, bottom: 0, right: 0), size: .init(width: 150, height: 50))
		nameInput.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		timer.anchor(top: nameInput.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 10, left: 0, bottom: 0, right: 0))
		timer.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		stopButton.anchor(top: timer.bottomAnchor, leading: nil, bottom: nil, trailing: nil, padding: .init(top: 40, left: 0, bottom: 0, right: 0), size: .init(width: 100, height: 30))
		
		stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
	}
	
	var count = 0
	
	func stopWatch() {
		self.start = Date()
		DispatchQueue.global(qos: .background).async { [weak self] in
			var count: UInt32 = 1
			while true {
				do {
					sleep(1)
					count += 1
					DispatchQueue.main.async { self?.updateTimer(count) }
				}
			}
		}
		//		let dispatchQueue = DispatchQueue(label: "QueueIdentification", qos: .background)
		//
		//		dispatchQueue.async{
		//			DispatchQueue.main.async{ self.count += 1 }
		//		}
	}
	
	func updateTimer(_ time: UInt32) {
		let hour = Int(time / 3600)
		var minutes = Int(time % 3600)
		let seconds = Int(minutes % 60)
		minutes = Int(minutes / 60)
		
		timer.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
	}
	
	@objc func stopCount() {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "dd/MM/yyyy, HH:mm:ss"
		
		let running = Running(name: nameInput.text!, start: dateFormatter.string(from: start!), end: dateFormatter.string(from: Date()))
	
		getRunning!(running)
		dismiss(animated: true)
	}
}
