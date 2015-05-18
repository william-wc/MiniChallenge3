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
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        setDisplay(highlighted)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setDisplay(selected)
    }
    
    private func setDisplay(selected:Bool) {
        
    }
    
    func animateIn(delay: Double, indexPath: NSIndexPath) {
        
    }
    
    func animateOut(delay: Double, indexPath: NSIndexPath) {
        
    }
}
