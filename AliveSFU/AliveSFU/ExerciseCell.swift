//
//  ExerciseCell.swift
//  AliveSFU
//
//  Created by Jim on 2016-11-27.
//  Copyright © 2016 SimonDevs. All rights reserved.
//

import UIKit

class ExerciseCell: UICollectionViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override init(frame: CGRect) {
        super.init(frame: frame);
    }
    
    @IBOutlet weak var exerciseThumbnail: UIImageView!
    @IBOutlet weak var exerciseName: UILabel!
    init(frame: CGRect, name: String, sets: String, reps: String) {
        super.init(frame:frame)
        
        Bundle.main.loadNibNamed("StrengthTileViewUI", owner: self, options: nil);
        self.addSubview(view);    // adding the top level view to the view hierarchy
        
        self.exerciseName.text = name;
        self.sets.text = sets;
        self.reps.text = reps;
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder);
    }
}
