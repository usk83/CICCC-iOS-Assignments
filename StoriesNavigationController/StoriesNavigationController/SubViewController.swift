//
//  SubViewController.swift
//  StoriesNavigationController
//
//  Created by Yusuke on 2020/04/23.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

class SubViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Exit", style: .plain, target: self, action: #selector(exit))
    }

    @objc func exit(_ sender: UIButton) {
        self.performSegue(withIdentifier: "unwindToFrontDoor", sender: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
