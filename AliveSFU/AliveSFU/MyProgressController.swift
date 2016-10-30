//
//  MyProgressController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class MyProgressController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPopup(_ sender: Any) {
        
        let popOverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "tilePopUpID") as! ExerciseTileViewController
        self.addChildViewController(popOverVC)
        popOverVC.view.frame = self.view.frame
        self.view.addSubview(popOverVC.view)
        popOverVC.didMove(toParentViewController: self)
        
    }


}

