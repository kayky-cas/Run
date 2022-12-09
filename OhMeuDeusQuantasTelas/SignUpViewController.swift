//
//  SignUpViewController.swift
//  OhMeuDeusQuantasTelas
//
//  Created by unicred on 08/12/22.
//

import UIKit

class SignUpViewController: UIViewController {
	public var users: [User] = []
	
	@IBOutlet private weak var name: UITextField!
	@IBOutlet private weak var email: UITextField!
	@IBOutlet private weak var password: UITextField!
	@IBOutlet private weak var confirmPassword: UITextField!
	
	@IBOutlet weak var error: UILabel!
	
	override func viewDidLoad() {
        super.viewDidLoad()
		
		navigationController?.isNavigationBarHidden = false
    }
	
	@IBAction func touchUpInside(_ sender: Any) {
		if email.text! == "" || password.text! == "" || name.text! == "" || confirmPassword.text! == "" {
			error.text = "Unwritten fields"
			return
		}
		
		if password.text! != confirmPassword.text! {
			error.text = "Senhas devem ser iguais!"
			return
		}
		
		signUp(name.text!, email.text!, password.text!)
	}
	
	func signUp(_ name: String, _ email: String, _ password: String) {
		if users.contains(where: { User in
			User.email == email
		}) {
			error.text = "Usuario ja encontrado!"
			return
		}
		
		users.append(User(name: name, email: email, password: password))
		
		navigateToUserNot()
	}
	
	func navigateToUserNot() {
		let main = UIStoryboard(name: "Main", bundle: Bundle.main)
		
		guard let signUp = main.instantiateViewController(identifier: "UserNotViewController") as? UserNotViewController else { return }
		
		signUp.users = users
		
		navigationController?.pushViewController(signUp, animated: true)
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
