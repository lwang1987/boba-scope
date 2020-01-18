//
//  NotificationVC.swift
//  Boba Scope
//
//  Created by Linglong Wang on 1/14/20.
//  Copyright © 2020 Linglong Wang. All rights reserved.
//

import UIKit

class NotificationVC: UITableViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 239/255, green: 217/255, blue: 206/255, alpha: 1)

        configureUserButton()
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
    
    // MARK: Component Functions
    @objc func loadUserProfile() {
        let userProfileVC = UserProfileVC()
        navigationController?.pushViewControllerFromLeft(controller: userProfileVC)
    }
    
    
    // MARK: View Functions
    func configureUserButton() {
        //self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: userButton)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "icons8-user-24"), style: .plain, target: self, action: #selector(loadUserProfile))
        
        
    }
}
