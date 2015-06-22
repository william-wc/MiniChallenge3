//
//  QuizCell.swift
//  MiniChallenge3
//
//  Created by Victor Lisboa on 25/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class QuizCell: UITableViewCell {

    @IBOutlet var options: UILabel!
    
    
    override func drawRect(rect: CGRect) {
        super.drawRect(rect)
        self.backgroundColor = UIColor.clearColor()
        self.layer.cornerRadius = 10.0
        self.clipsToBounds = true
    }
    

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
