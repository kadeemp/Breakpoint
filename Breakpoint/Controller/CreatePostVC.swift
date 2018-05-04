//
//  CreatePostVC.swift
//  Breakpoint
//
//  Created by Kadeem Palacios on 5/3/18.
//  Copyright © 2018 Kadeem Palacios. All rights reserved.
//

import UIKit
import Firebase

class CreatePostVC: UIViewController {

    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var textView: UITextView!

    @IBOutlet weak var sendBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.delegate = self
        sendBtn.bindToKeyboard()
        
    }

    @IBAction func sendBtnPressed(_ sender: Any) {
        if textView.text != nil && textView.text != "Say something here..." {
            //sendBtn.isEnabled = false
            DataService.instance.uploadPost(withMessage: textView.text!, withUiD: (Auth.auth().currentUser?.uid)!, withGroupKey: nil, sendComplete: { (isComplete) in
                if isComplete {
//                    self.sendBtn.isEnabled = true
                    self.dismiss(animated: true, completion: nil)
                } else {
//                    self.sendBtn.isEnabled = true
                    print("There was an error!")
                }
            })
        }
    }
    @IBAction func closeBtnPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

extension CreatePostVC:UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        textView.text = ""
    }

}
