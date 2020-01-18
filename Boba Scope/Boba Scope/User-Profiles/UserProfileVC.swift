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
    
    
    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.tintColor = .lightGray
        return iv
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Full Name"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 219/255, green: 213/255, blue: 229/255, alpha: 1.0)
       
        view.addSubview(profileImageView)
        profileImageView.anchor(top: view.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 115, paddingLeft: 141, paddingBottom: 50, paddingRight: 141, width: 130, height: 130)
        profileImageView.layer.cornerRadius = 130/2
        configureLogoutButton()
        
        view.addSubview(nameLabel)
        nameLabel.anchor(top: profileImageView.bottomAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 10, paddingLeft: 167, paddingBottom: 0, paddingRight: 140, width: 0, height: 0)
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
