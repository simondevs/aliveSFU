//
//  SearchResultController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-12-02.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class SearchResultController: UIViewController {
    
    @IBOutlet weak var contentView: UIView!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    
    let TILE_HEIGHT = CGFloat(80)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = true
        populateStackView()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        //self.navigationController?.isNavigationBarHidden = false
        
    }
    
    func populateStackView() {
        //since the view is now changed, get rid of all preexisting subviews
        for view in contentView.subviews {
            view.removeFromSuperview()
        }
        //Populate Exercise Tiles
        let firebaseCtlr = firebaseController()
        var buddies = [firebaseProfile]()
        firebaseCtlr.returnClosestMatch(weight: 5, function: {profile in
            buddies = profile
            print(buddies)
            
            var count = 0
            for buddy in buddies {
                
                //let hashToFields =          //Wait for liam to finish it
                
                // Add func showPopup that will show the popup
                // Add func tileSlideGesture that will send a request to the
                //          particular user
                
                /*
                 
                 let frame = CGRect(x: 0, y: CGFloat(contentView.subviews.count) * (TILE_HEIGHT + 5), width: scrollView.bounds.width, height: TILE_HEIGHT)
                 
                 let tile = BuddyTileView(frame: , name: hash.name, goals: hash.goals, age: hash.age, freq: hash.freq)
                 
                 let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.showPopup(_:)))
                 tile.addGestureRecognizer(tapGesture)
                 
                 let slideGesture = UIPanGestureRecognizer(target: self, action: #selector (self.tileSlideGesture(_:)))
                 slideGesture.delegate = self
                 tile.addGestureRecognizer(slideGesture)
                 //scrollView.panGestureRecognizer.require(toFail: slideGesture)
                 
                 contentView.addSubview(tile)
                 }
                 count += 1;
                 }
                 */
            }
            if (count == 0) {
                //Display Placeholder Exercise Tile
                
                // Create a new image for this placeholder
                
                /*
                 let placeholder = UIImageView(image: UIImage(named: "noExercisePlaceholder"))
                 placeholder.tag = PLACEHOLDER_TAG
                 placeholder.frame = CGRect(x: 0, y: -40, width: self.view.frame.width - 40, height: 500)
                 contentView.addSubview(placeholder)
                 */
            }
        })
    }
}
