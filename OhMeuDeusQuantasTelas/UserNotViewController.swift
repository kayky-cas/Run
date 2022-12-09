//
//  ViewController.swift
//  OhMeuDeusQuantasTelas
//
//  Created by unicred on 08/12/22.
//

import UIKit

class UserNotViewController: UIViewController {
	public var users: [User] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	override func viewDidAppear(_ animated: Bool) {
		navigationController?.isNavigationBarHidden = true
	}

	@IBAction func touchUpInsideToSignUp(_ sender: Any) {
		navigateToSignUp()
	}
	
	func navigateToSignUp() {
		let main = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let signUp = main.instantiateViewController(identifier: "SignUpViewController") as? SignUpViewController else { return }
		signUp.users = users
		
		navigationController?.pushViewController(signUp, animated: true)
		
	}
	
	@IBAction func touchUpInsideToSignIn(_ sender: Any) {
		navigateToSignIn()
	}
	
	func navigateToSignIn() {
		let main = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let signIn = main.instantiateViewController(identifier: "SignInViewController") as? SignInViewController else { return }
		signIn.users = users
		
		navigationController?.pushViewController(signIn, animated: true)
	}
}

