
//  RunningCell.swift
//  Run
//
//  Created by unicred on 14/12/22.
//

import UIKit

let RUNNING_CELL_HEIGHT = 80.0
let RUNNING_CELL_B_PADDING = 10.0

let CELL_ID = "chowchow"

class RunningCell: UICollectionViewCell {
	var running: Running? {
		didSet {
			name.text = running?.name
			elapsed.text = formatElapsed()
			time.text = formatDates()
		}
	}
	
	lazy var containner: UIView = {
		let containner = UIView()
		
		containner.backgroundColor = UIColor.white
		
		containner.layer.borderColor = UIColor.systemPink.cgColor
		containner.layer.borderWidth = 2.5
		containner.layer.cornerRadius = 15
		
		return containner
	}()
	
	lazy var image: UIImageView = {
		let image = UIImageView(image: UIImage(systemName: "flag.2.crossed"))
		
		image.tintColor = .systemPink
		
		return image
	}()
	
	lazy var name: UILabel = {
		let label = UILabel()
		
		label.font = UIFont.boldSystemFont(ofSize: 18)
		label.text = "Claudio"
		label.textColor = .systemPink
		
		return label
	}()
	
	lazy var elapsed: UILabel = {
		let label = UILabel()
		
		label.text = "53 min"
		label.font = UIFont.boldSystemFont(ofSize: 20)
		label.textColor = .systemPink
		label.numberOfLines = 2
		label.textAlignment = .center
		
		return label
	}()
	
	lazy var time: UILabel = {
		let label = UILabel()
		
		label.text = "Claudio"
		label.font = UIFont.italicSystemFont(ofSize: 15)
		label.textColor = .systemPink
		
		return label
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configView()
	}
	
	public func setRunning(_ running: Running) {
		self.running = running
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configView() {
		addSubviews(containner)
		containner.addSubviews(image, name, elapsed, time)
		setConstraints()
	}
	
	func setConstraints() {
		setConstraintsContainner()
		setConstraintsImage()
		setConstraintsDescription()
		setConstraintsElapsedTime()
	}
	
	func setConstraintsElapsedTime() {
		elapsed.anchor(top: nil, leading: nil, bottom: nil, trailing: containner.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 10), size: .init(width: 45, height: RUNNING_CELL_HEIGHT))
		
		elapsed.centerYAnchor.constraint(equalTo: containner.centerYAnchor).isActive = true
	}
	
	func setConstraintsDescription() {
		name.anchor(top: containner.topAnchor, leading: image.trailingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 5, bottom: 0, right: 0), size: .init(width: 200, height: 50))
		
		time.anchor(top: nil, leading: image.trailingAnchor, bottom: containner.bottomAnchor, trailing: nil, padding: .init(top: 0, left: 5, bottom: 0, right: 0), size: .init(width: 200, height: 50))
	}
	
	func setConstraintsContainner() {
		containner.anchor(top: safeAreaLayoutGuide.topAnchor, leading: safeAreaLayoutGuide.leadingAnchor, bottom: safeAreaLayoutGuide.bottomAnchor, trailing: safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 10, bottom: 5	, right: 10), size: .init(width: frame.width, height: RUNNING_CELL_HEIGHT))
	}
	
	func setConstraintsImage() {
		image.anchor(top: nil, leading: containner.leadingAnchor, bottom: nil, trailing: nil, padding: .init(top: 0, left: 15, bottom: 0, right: 0), size: .init(width: RUNNING_CELL_HEIGHT - 15, height: RUNNING_CELL_HEIGHT - 40))
		
		image.centerYAnchor.constraint(equalTo: containner.centerYAnchor).isActive = true
	}
	
	func formatDates() -> String {
		let date = DateFormatter()
		date.dateFormat = "dd/MM"
		
		let runningDate = date.string(from: running!.start)
		
		let hour = DateFormatter()
		hour.dateFormat = "HH:mm"
		
		let start = hour.string(from: running!.start)
		let end = hour.string(from: running!.end)
		
		return "\(runningDate) \(start) - \(end)"
	}
	
	func formatElapsed() -> String {
		let elapsed = running!.elapsed()
		
		let hour = elapsed / 3600
		let minutes = elapsed / 60
		
		if hour != 0 {
			return "\(hour) hour"
		}
		
		if minutes != 0 {
			return "\(minutes) min"
		}
		
		return "\(elapsed) sec"
	}
}

