//
//  SideMenuCell.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class SideMenuCell: UITableViewCell, BaseAnimatableCell {
    
    @IBOutlet weak var selectionBar: UIView!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var lblText: UILabel!
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        setDisplay(highlighted)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setDisplay(selected)
    }
    
    private func setDisplay(b:Bool) {
        if b {
            self.backgroundColor = UIColor(white: 0.9, alpha: 0.7)
        } else {
            self.backgroundColor = UIColor.clearColor()
        }
    }
    
    func animateIn(delay: Double, indexPath: NSIndexPath) {
        
    }
    
    func animateOut(delay: Double, indexPath: NSIndexPath) {
        
    }
}
