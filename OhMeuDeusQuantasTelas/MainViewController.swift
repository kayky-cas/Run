//
//  MainViewController.swift
//  OhMeuDeusQuantasTelas
//
//  Created by unicred on 08/12/22.
//

import UIKit

class MainViewController: UIViewController {
	public var users: [User] = []
	public var currentUser: User?
	
	@IBOutlet weak var name: UILabel!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		if let user = currentUser {
			name.text = "Welcome \(user.name)!"
		}
	}
	
	override func viewDidAppear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}
	
	@IBAction func touchUpInsideLoggout(_ sender: Any) {
		currentUser = nil
		checkUser()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		checkUser()
	}
	
	func checkUser() {
		if currentUser == nil {
			let main = UIStoryboard(name: "Main", bundle: Bundle.main)
			
			guard let signUp = main.instantiateViewController(identifier: "UserNotViewController") as? UserNotViewController else { return }
			
			signUp.users = users
			
			navigationController?.pushViewController(signUp, animated: true)
		}
	}
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
