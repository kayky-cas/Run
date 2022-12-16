//
//  RunningCollection.swift
//  Run
//
//  Created by unicred on 15/12/22.
//

import UIKit

class RunningCollection: UICollectionView {
	
	var running: [Running] = [
		Running(name: "Corridinha Show", start: "14/12/2022, 13:00:00", end: "14/12/2022, 14:00:00"),
		Running(name: "Corridinha Chow Chow", start: "24/06/2022, 08:30:00", end: "24/06/2022, 08:45:00"),
		Running(name: "Corrida ultra master blaster 4k full hd", start: "05/04/2021, 16:00:40", end: "05/04/2021, 16:32:42"),
		Running(name: "Oi batata", start: "02/10/2022, 02:00:40", end: "02/10/2022, 03:32:42"),
		Running(name: "Eu corri????", start: "15/10/2021, 15:00:40", end: "15/10/2021, 15:32:42"),
		Running(name: "Corrida ultra master blaster 4k full hd", start: "05/04/2021, 16:10:40", end: "05/04/2021, 16:32:42"),
		Running(name: "Oh", start: "05/04/2021, 16:20:40", end: "05/04/2021, 16:32:42"),
		Running(name: "Meu", start: "05/04/2021, 16:10:40", end: "05/04/2021, 16:52:42"),
		Running(name: "Deus", start: "05/04/2021, 16:00:40", end: "05/04/2021, 16:56:42")
	]
	
	init() {
		super.init(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
		configCollection()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	func configCollection() {
		dataSource = self
		delegate = self
		register(RunningCell.self, forCellWithReuseIdentifier: CELL_ID)
		
		backgroundColor = UIColor(white: 1, alpha: 0)
	}
	
	func pushRunning(_ running: Running) {
		self.running.insert(running, at: 0)
	}
}

extension RunningCollection: UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return running.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		var cell = UICollectionViewCell()
		
		if let runningCell = collectionView.dequeueReusableCell(withReuseIdentifier: CELL_ID, for: indexPath) as? RunningCell {
			runningCell.setRunning(running[indexPath.item])
			cell = runningCell
		}
		
		return cell
	}
	
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: frame.width, height: RUNNING_CELL_HEIGHT)
	}
}
