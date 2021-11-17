//
//  ProfileViewController.swift
//  Messengar1
//
//  Created by administrator on 28/10/2021.
//

import UIKit
import FirebaseAuth
class ProfileViewController: UIViewController {
    
    @IBAction func Singout(_ sender: Any) {
        LogOut()
        print("logout")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        //LogOut()
    }
    
    func  LogOut(){
        let alert = UIAlertController(title: "", message: "", preferredStyle: .actionSheet)
        alert.addAction(UIAlertAction(title: "Logooout", style: .destructive, handler: {[weak self] action in
            guard let self = self else {return}
            
            do{
                try FirebaseAuth.Auth.auth().signOut()
                let minStoryboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = minStoryboard.instantiateViewController(withIdentifier: "login id") as! LoginViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
            }
            catch {
                print("faillllled to logout")
            }
        }))
        present(alert,animated: true,completion: nil)
    
    }
}
                        
                        
                        
                        
                        
