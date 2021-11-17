//
//  ViewController.swift
//  Messengar1
//
//  Created by administrator on 28/10/2021.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController{
   
@IBOutlet weak var userEmailTxtField: UITextField!
@IBOutlet weak var passwordTxtField: UITextField!
override func viewDidLoad() {
super.viewDidLoad()
}
    
 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
@IBAction func Login(_ sender: Any) {
firebaseAuth()

func firebaseAuth() {
// log in
// Firebase Login
    FirebaseAuth.Auth.auth().signIn(withEmail: userEmailTxtField.text!, password:passwordTxtField.text!,completion: { authResult, error in
    
guard let result = authResult, error == nil else {
    print("Failed to log in user with email \(self.userEmailTxtField.text!)")
    alertUserLoginError ()
    return
}
let user = result.user
print("logged in user: \(user)")
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        self.performSegue(withIdentifier: "GotoStroryboard",sender: self)
        
})
    
      ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
                        
func alertUserLoginError () {
let alert = UIAlertController(title: "ooooooops",message: "pleas enter all information to log in",preferredStyle: .alert)
                alert.addAction(UIAlertAction(title:"Disimiss", style: .cancel,handler: nil))
    present(alert, animated: true)
            }
                        
                /////////////////////////////////////////////////////////////////////////////////////////////
   
                

        
}
    }
}
    






