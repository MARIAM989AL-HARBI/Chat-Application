//
//  ConversationViewController.swift
//  Messengar1
//
//  Created by administrator on 28/10/2021.
//

import UIKit
import FirebaseAuth
import Firebase

class ConversationsViewController: UIViewController , UITableViewDelegate , UITableViewDataSource{
    
    //variables
    @IBOutlet weak var chatsTableView: UITableView!
    
 
    override func viewDidLoad() {
            super.viewDidLoad()
        
        self.chatsTableView.delegate = self
        self.chatsTableView.dataSource = self

        }
    @IBAction func newConAction(_ sender: UIBarButtonItem) {
            var nextVC = storyboard?.instantiateViewController(withIdentifier: "NewConversationViewController") as! NewConversationViewController
            navigationController?.pushViewController(nextVC, animated: true)
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: "CellMariam", for: indexPath)
            
            //chat person name
            cell.textLabel?.text = "DA___!"

            return cell
        }
    //number of rows
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            //tableView.deselectRow(at: indexPath, animated: true)
            
            let vc = storyboard?.instantiateViewController(withIdentifier: "ChatViewController") as! ChatViewController
                    vc.title = "Chat"
                    vc.navigationItem.largeTitleDisplayMode = .never
                    navigationController?.pushViewController(vc, animated: true)
        }
        
        override func viewDidAppear(_ animated: Bool) {
            super.viewDidAppear(animated)
            validateAuth()
       
        }
    private func validateAuth(){
                // current user is set automatically when you log a user in
            if Auth.auth().currentUser == nil {
                // present login view controller if user not logged in
                let vc = storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
                
                let nav = UINavigationController(rootViewController: vc)
                nav.modalPresentationStyle = .fullScreen
                present(nav, animated: false)
                //push
    //            navigationController?.pushViewController(vc, animated: true)
            }
            }
        
    }
