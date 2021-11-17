//
//  RegistraViewController.swift
//  Messengar1
//
//  Created by administrator on 28/10/2021.
//

import UIKit
import Firebase

class RegistraViewController: UIViewController {
    var ref: DatabaseReference!
@IBAction func Add(_ sender: Any) {
    profileActionSheet()
}
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    ////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @IBAction func onRegisterClicked(_ sender: UIButton) {
        signUpAUser()
        
    }
    
    
    func signUpAUser() {
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { result, error in
            if let error = error {
                print("Error \(error.localizedDescription)")
            } else { print("work")
               

                self.ref = Database.database().reference()
              let userid = Auth.auth().currentUser?.uid
                self.ref.child("users").child(userid!).setValue([
                    "firstName": self.firstNameTextField.text! ,
                    "lastName":self.lastNameTextField.text!,
                    "email": self.emailTextField.text!
                ] )
                self.navigationController?.setNavigationBarHidden(true, animated: true)
                self.performSegue(withIdentifier: "GotoStroryboard",sender: self)
              //  let vc = self.storyboard?.instantiateViewController(withIdentifier: "profile")as!ProfileViewController
              //  self.present(vc, animated: true, completion: nil)
                // go to the conversation view controller
                // let converstationViewController = storyboard?.instantiateViewController(withIdentifier: "") as ____
            }
        }
    }
    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    @IBOutlet weak var imag: UIImageView!
    func profileActionSheet() {
let actionSheet = UIAlertController(title: "Profile Picture", message: "How would you like to select a picture?", preferredStyle: .actionSheet)
actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: { [ weak self ] _ in
self?.getPhotoFromCamera()
}))
    
actionSheet.addAction(UIAlertAction(title: "Choose Photo", style: .default, handler: { [weak self] _ in
self?.getPhotoFromLibrary()

}))
present(actionSheet, animated: true)
}
func getPhotoFromCamera() {
let picker = UIImagePickerController()
picker.sourceType = .camera
picker.isEditing = true
picker.delegate = self
present(picker, animated: true, completion: nil)
}
                                                        
func getPhotoFromLibrary() {
let picker = UIImagePickerController()
picker.sourceType = .photoLibrary
picker.isEditing  = true
picker.delegate = self
present(picker, animated: true, completion: nil)

                                                        
}
                          
}

extension RegistraViewController : UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let editedImage = info[.originalImage] as! UIImage
                                                    
                imag.image = editedImage
        dismiss(animated: true , completion: nil)

func imagePickerControllerDidCancel( picker: UIImagePickerController) {
dismiss(animated: true , completion: nil)
}

}
}
