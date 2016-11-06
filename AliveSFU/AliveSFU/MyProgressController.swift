//
//  MyProgressController.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-10-26.
//  Developers: Liam O'Shaughnessy
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit
import CoreData

class MyProgressController: UIViewController {
    //@IBOutlet weak var stackView: UIStackView!

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var contentView: UIView!

    let CATEGORY_CARDIO_VIEW_TAG = 100
    @IBOutlet weak var contentViewHeight: NSLayoutConstraint!
    let CATEGORY_STRENGTH_VIEW_TAG = 200
    let TILE_HEIGHT = CGFloat(80)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let leftEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector (handleSwipes(_:)))
        
        let rightEdge = UIScreenEdgePanGestureRecognizer(target: self, action: #selector (handleSwipes(_:)))
        
        leftEdge.edges = .left
        rightEdge.edges = .right
        
        view.addGestureRecognizer(leftEdge)
        view.addGestureRecognizer(rightEdge)
        // Do any additional setup after loading the view, typically from a nib.
        for view in contentView.subviews {
          //  stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        populateStackView()
        
        //let newContentFrame = CGRect(x: contentView.frame.origin.x, y: contentView.frame.origin.y, width: contentView.frame.width, height: CGFloat(contentView.subviews.count) * TILE_HEIGHT)
        contentViewHeight.constant = CGFloat(contentView.subviews.count) * TILE_HEIGHT
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        for view in contentView.subviews {
            //stackView.removeArrangedSubview(view)
            view.removeFromSuperview()
        }
    }
    
    override func viewDidLayoutSubviews() {
        scrollView.contentSize.height = CGFloat(contentView.subviews.count) * TILE_HEIGHT
        scrollView.isScrollEnabled = true;
        scrollView.isUserInteractionEnabled = true;
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func showPopup(_ sender: UITapGestureRecognizer) {
        
        if (sender.view?.tag == CATEGORY_CARDIO_VIEW_TAG) {
            let popoverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "cardioTilePopover") as! PopoverCardioTile
            self.addChildViewController(popoverVC)
            popoverVC.view.frame = self.view.frame
            self.view.addSubview(popoverVC.view)
            
            let tile = sender.view as! CardioTileView
            
            popoverVC.exerciseName.text = tile.exerciseName.text
            popoverVC.time.text = tile.time.text
            popoverVC.speed.text = tile.speed.text
            popoverVC.resistance.text = tile.resistance.text
            
            popoverVC.didMove(toParentViewController: self)

        } else if (sender.view?.tag == CATEGORY_STRENGTH_VIEW_TAG) {
            let popoverVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "strengthTilePopover") as! PopoverStrengthTile
            self.addChildViewController(popoverVC)
            popoverVC.view.frame = self.view.frame
            self.view.addSubview(popoverVC.view)
            
            let tile = sender.view as! StrengthTileView
            
            popoverVC.exerciseName.text = tile.exerciseName.text
            popoverVC.sets.text = tile.sets.text
            popoverVC.reps.text = tile.reps.text
            popoverVC.didMove(toParentViewController: self)
        }
    }
    
    func handleSwipes(_ recognizer: UIScreenEdgePanGestureRecognizer){
        if (recognizer.state == .recognized) {
            if(recognizer.edges == .left) {
                print("Swipe Right from left edge ")//dummy code
                }
            if(recognizer.edges == .right) {
                print("Swipe Left from right edge") //dummy code
                }
        }
        //NEED TO GET ARRAY DATA AND CHANGE TILES IN THE VIEW CONTROLLER
    }
    
    func populateStackView() {
        let exerciseArrayCount = DataHandler.getExerciseArrayCount()
        if (exerciseArrayCount == 0) {
            //Display Placeholder Exercise Tile
            print("Works")
        } else {
            //Populate Exercise Tiles
            let exerciseArray = DataHandler.getExerciseArray()
            
            for elem in exerciseArray {
                
                let frame = CGRect(x: 0, y: CGFloat(contentView.subviews.count - 1) * 85, width: scrollView.bounds.width, height: TILE_HEIGHT)
                
                if (elem.category == elem.CATEGORY_CARDIO) {
                    let tile = CardioTileView(frame: frame, name: elem.exerciseName, time: elem.time, speed: elem.speed, resistance: elem.resistance)

                    let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.showPopup(_:)))
                    tile.addGestureRecognizer(tapGesture)
                    
                    tile.tag = CATEGORY_CARDIO_VIEW_TAG

                    contentView.addSubview(tile)
                } else {
                    let tile = StrengthTileView(frame: frame, name: elem.exerciseName, sets: elem.sets, reps: elem.reps)

                    let tapGesture = UITapGestureRecognizer(target: self, action:  #selector (self.showPopup(_:)))
                    tile.addGestureRecognizer(tapGesture)
                    
                    tile.tag = CATEGORY_STRENGTH_VIEW_TAG

                    contentView.addSubview(tile)
                }
                //print("Stack Height: ", stackView.frame.height)
            }
        }
    }
    
    func createTile() {
        
    }
}

