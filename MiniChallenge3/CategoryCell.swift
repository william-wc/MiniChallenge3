//
//  CategoryCell.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 14/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell, BaseAnimatableCell {
    
    let anim_duration = 0.4
    let lineOffset:CGFloat = 10
    let highlightedColor = UIColor(red: 102/256.0, green: 185/256.0, blue: 165/256.0, alpha: 1.0)
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    @IBOutlet weak var selectionBar: UIView!

    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        setDisplay(highlighted)
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        setDisplay(selected)
    }
    
    private func setDisplay(selected: Bool) {
        if selected {
            selectionBar.backgroundColor = highlightedColor
        } else {
            selectionBar.backgroundColor = UIColor.clearColor()
        }
    }
    
    func animateIn(delay: Double, indexPath: NSIndexPath) {
        var t0 = CGAffineTransformMakeTranslation(self.bounds.width, 0)
        CGAffineTransformScale(t0, 0.8, 0.8)
        var t1 = CGAffineTransformIdentity
        
        self.alpha = 0.2
        self.transform = t0
        UIView.animateWithDuration(
            anim_duration,
            delay: delay,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.1,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.alpha = 1.0
                self.transform = t1
            },
            completion: nil)
    }
    
    func animateOut(delay:Double, indexPath: NSIndexPath) {
        var t1 = CGAffineTransformMakeTranslation(-self.bounds.width, 0)
        CGAffineTransformScale(t1, 0.8, 0.8)
        
        UIView.animateWithDuration(
            anim_duration,
            delay: delay,
            usingSpringWithDamping: 0.7,
            initialSpringVelocity: 0.1,
            options: UIViewAnimationOptions.CurveEaseIn,
            animations: { () -> Void in
                self.alpha = 0.1
                self.transform = t1
            },
            completion: nil)
    }
    
    
}