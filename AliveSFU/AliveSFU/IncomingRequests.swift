//
//  IncomingRequests.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-11-29.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class IncomingRequests: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //check if our user has sent a request for any of these users
        //if so, then a match has been found
        let outgoingRequests = DataHandler.getOutgoingRequests()
        let username = DataHandler.getCurrentUser()
        for elem in outgoingRequests {
            if elem.userName == username {
                //a match has been found!
            }
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = false
        
    }
}
