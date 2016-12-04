//
//  SFURecreationController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Developers: Vivek Sharma
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit
import JBChart

class SFURecreationController: UIViewController {

    @IBOutlet weak var todayHours: UILabel!
    @IBOutlet weak var overlayHours: UIView!
    @IBOutlet weak var todayHourView: UIView!
    @IBOutlet weak var overlayHeight: NSLayoutConstraint!
    
    var isOverlayOpen = false
    var isAnimating = false
    
    let HEIGHT_OF_OVERLAY:CGFloat = 180
    
    override func viewDidLoad() {
        super.viewDidLoad()
	
	let tapGesture = UITapGestureRecognizer(target: self, action: #selector (todayHoursAction(_:)))
        todayHourView.addGestureRecognizer(tapGesture)
        todayHourView.isUserInteractionEnabled = true
        
        overlayHeight.constant = 0
        isOverlayOpen = false

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

    }

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func todayHoursAction(_ recognizer: UITapGestureRecognizer) {
        if (!isOverlayOpen) {
            //Open overlay
            var frame = overlayHours.frame
            frame.size.height = HEIGHT_OF_OVERLAY
            if (!isAnimating) {
                isAnimating = true
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {self.overlayHours.frame = frame}, completion: {(completed: Bool) -> Void in
                    self.isAnimating = false
                    self.isOverlayOpen = true
                })
            }
        } else {
            var frame = overlayHours.frame
            frame.size.height = 0
            if (!isAnimating) {
                isAnimating = true
                
                UIView.animate(withDuration: 0.5, delay: 0.0, options: .curveEaseInOut, animations: {self.overlayHours.frame = frame}, completion: {(completed: Bool) -> Void in
                    self.isAnimating = false
                    self.isOverlayOpen = false
                })
            }
        }
    }
}

