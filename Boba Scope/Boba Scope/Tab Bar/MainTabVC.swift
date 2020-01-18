//
//  MainTabVC.swift
//  Boba Scope
//
//  Created by Linglong Wang on 1/14/20.
//  Copyright © 2020 Linglong Wang. All rights reserved.
//

import UIKit
import Firebase

class MainTabVC: UITabBarController, UITabBarControllerDelegate {
    
    // MARK: - Properties
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 239/255, green: 217/255, blue: 206/255, alpha: 1)

        //delegate
        self.delegate = self
        
        configureViewControllers()
        

        checkIfUserIsLoggedIn()
    }

    func configureViewControllers() {
        // home feed controller
        let notificationVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "icons8-light-on-30-2"), selectedImage: #imageLiteral(resourceName: "icons8-light-on-30"), rootViewController: NotificationVC())
        
        // search feed controller
        let exploreVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "icons8-radar-30"), selectedImage: #imageLiteral(resourceName: "radar-black"), rootViewController: ExploreVC())
        // post controller
        
        let launchVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "icons8-rocket-30"), selectedImage: #imageLiteral(resourceName: "rocket-balck"), rootViewController: LaunchVC())
        
        // notification controller
        let collectionVC = constructNavController(unselectedImage: #imageLiteral(resourceName: "icons8-playlist-30"), selectedImage: #imageLiteral(resourceName: "playlist-black30"), rootViewController: CollectionVC())
        
        //view controller to be added to tab controller
        viewControllers = [notificationVC, exploreVC, launchVC, collectionVC]
        //tabBar.backgroundColor = UIColor(red: 190, green: 149, blue: 196, alpha: 1)
        //tabBar.isTranslucent = false
        let tabColor = UIColor(red: 190, green: 149, blue: 196, alpha: 1)
        tabBar.barTintColor = tabColor

        tabBar.tintColor = .black
    }
    
    /// construct navigation controllers
    func constructNavController(unselectedImage: UIImage,selectedImage: UIImage, rootViewController: UIViewController = UIViewController() )->UINavigationController{
        
        let navController = UINavigationController(rootViewController: rootViewController)
        navController.tabBarItem.image = unselectedImage
        navController.tabBarItem.selectedImage = selectedImage
        navController.navigationBar.tintColor = .black
        
        return navController
        
    }
    
    
    func checkIfUserIsLoggedIn(){
        if Auth.auth().currentUser == nil{
            print("No Current User")
            
            DispatchQueue.main.async {
                let loginVC = LoginVC()
                let navController = UINavigationController(rootViewController: loginVC)
                self.present(navController,animated: true, completion: nil)
            }
            
            return
            
            
        }
    }
    
    
}
