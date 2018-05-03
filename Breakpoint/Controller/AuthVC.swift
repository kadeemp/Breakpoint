//
//  AuthVC.swift
//  Breakpoint
//
//  Created by Kadeem Palacios on 4/26/18.
//  Copyright © 2018 Kadeem Palacios. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import Firebase

class AuthVC: UIViewController {

    @IBOutlet weak var loginStack: UIStackView!
    override func viewDidLoad() {
        super.viewDidLoad()
        let loginbtn = FBSDKLoginButton()
        loginbtn.readPermissions = ["public_profile","user_friends"]
        
        loginStack.addArrangedSubview(loginbtn)
    }

    override func viewDidAppear(_ animated: Bool) {
        if AuthService.isLoggedIn() == true {
            dismiss(animated: true, completion: nil)
        }
    }

    @IBAction func facebookSignInBtnPressed(_ sender: Any) {
    }
    @IBAction func signInWithEmailBtnPressed(_ sender: Any) {
        let loginVC = storyboard?.instantiateViewController(withIdentifier: "LoginVC")
        present(loginVC!, animated: true, completion: nil)
    }
    @IBAction func googleSignInBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
