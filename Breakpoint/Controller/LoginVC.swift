//
//  LoginVC.swift
//  Breakpoint
//
//  Created by Kadeem Palacios on 4/26/18.
//  Copyright © 2018 Kadeem Palacios. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    var window: UIWindow?

    @IBOutlet weak var emailField: InsetTextField!
    @IBOutlet weak var passwordField: InsetTextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        emailField.delegate = self
        passwordField.delegate = self

    }

    @IBAction func signInBtnPressed(_ sender: Any) {
        if emailField.text != nil && passwordField.text != nil {
            AuthService.instance.loginUser(withEmail: emailField.text!,
                                           andPassword: passwordField.text!,
                                           completion:{ (success, error) in
                                            if success {
                                                self.dismiss(animated: true, completion: nil)
//                                                let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
//                                                let tabVC = storyboard.instantiateViewController(withIdentifier: "MainTabController")
//                                                self.window?.makeKeyAndVisible()
//                                                self.window?.rootViewController?.present(tabVC, animated: true, completion: nil)
                                                return
                                            }
                                            else {
                                                print(String(describing: error!.localizedDescription))
                                            }
            })
            AuthService.instance.registerUser(withEmail: emailField.text!,
                                              andPassword: passwordField.text!,
                                              completion: {(success, registrationError) in
                                                if success {
                                                    self.dismiss(animated: true, completion: nil)
                                                    return 
                                                }
                                                else {
                                                    print(String(describing: registrationError?.localizedDescription))
                                                }
            })
        }
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}

extension LoginVC:UITextFieldDelegate {

}
