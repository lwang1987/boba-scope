//
//  UserProfileVC.swift
//  Boba Scope
//
//  Created by Linglong Wang on 1/15/20.
//  Copyright © 2020 Linglong Wang. All rights reserved.
//

import UIKit
import Firebase

class UserProfileVC: UIViewController{
    // MARK: - Properties
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 239/255, green: 217/255, blue: 206/255, alpha: 1)
       
        configureLogoutButton()
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        hidesBottomBarWhenPushed = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureLogoutButton(){
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain , target: self, action: #selector(handleLogout))
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-right-26"), style: .plain, target: self, action: #selector(handleBack))
        //self.navigationItem.backBarButtonItem
    }
    
    @objc func handleBack(){
        navigationController?.popViewControllerToLeft()
    }
    
    @objc func handleLogout(){
        print("handle logout")
        
        let alertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        //alert action
        alertController.addAction(UIAlertAction(title: "Log Out", style: .destructive, handler: {(_) in
            do{
                
                try Auth.auth().signOut()
                
                let loginVC = LoginVC()
                let navController = UINavigationController(rootViewController: loginVC)
                self.present(navController,animated: true, completion: nil)
                
                
            } catch {
                print("failed to sign out")
            }
        }))
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alertController,animated: true, completion:nil)
    }
    
}
