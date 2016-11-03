//
//  CardioTileView.swift
//  AliveSFU
//
//  Created by Gur Kohli on 2016-11-01.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class CardioTileView: UIView {
    @IBOutlet var view: UIView!
    
    let TILE_HEIGHT = CGFloat(75);
    let PADDING = CGFloat(5);

    override init(frame: CGRect) {
        super.init(frame: frame);
        Bundle.main.loadNibNamed("CardioTileViewUI", owner: self, options: nil);
        self.addSubview(view);    // adding the top level view to the view hierarchy
    }
    
    override func didMoveToSuperview() {
        let subViewCount = CGFloat(superview!.subviews.count)
        var yC: CGFloat
        if (subViewCount == 1) {
            yC = superview!.frame.origin.y;
        } else {
            yC = superview!.frame.origin.y + (TILE_HEIGHT * CGFloat(superview!.subviews.count - 1))
        }
        
        view.frame = CGRect(x: superview!.frame.origin.x, y: yC, width: self.frame.width, height: TILE_HEIGHT)
        //self.frame = CGRect(x: superview!.frame.origin.x, y: yC, width: self.frame.width, height: TILE_HEIGHT)
        print("XCoord:", yC, " Count: ", superview!.subviews.count, " Height:", view.frame.height)
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
    
}
