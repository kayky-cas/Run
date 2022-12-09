//
//  SignInViewController.swift
//  OhMeuDeusQuantasTelas
//
//  Created by unicred on 08/12/22.
//

import UIKit

class SignInViewController: UIViewController {
	public var users: [User] = []
	
	@IBOutlet weak var email: UITextField!
	@IBOutlet weak var password: UITextField!
	
	@IBOutlet weak var error: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		navigationController?.isNavigationBarHidden = false
        // Do any additional setup after loading the view.
    }
	

	@IBAction func touchUpLogin(_ sender: Any) {
		signIn()
	}
	
	func signIn() {
		if email.text! == "" || password.text! == "" {
			error.text = "Unwritten fields"
			return
		}
		
		login(email.text!, password.text!)
	}
	
	func login(_ email: String, _ password: String) {
		let user = users.first { User in
			User.email == email
		}
		
		if user == nil {
			error.text = "Email not found!"
			return
		}

		if user!.password == password {
			navigateToMain(user!)
			return
		}
		
		
		error.text = "Wrong password!"
	}
	
	func navigateToMain(_ user: User) {
		let main = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let mainVC = main.instantiateViewController(identifier: "MainViewController") as? MainViewController else { return }
		mainVC.currentUser = user
		mainVC.users = users
		navigationController?.pushViewController(mainVC, animated: true)
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
