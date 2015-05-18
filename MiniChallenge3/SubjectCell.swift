//
//  SubjectCell.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class SubjectCell: UICollectionViewCell, BaseAnimatableCell {
    
    @IBOutlet weak var image:UIImageView!
    @IBOutlet weak var text :UILabel!
    
    
    func setHighlight(highlight:Bool) {
        setDisplay(highlight)
    }
    
    func setSelect(selected:Bool) {
        setDisplay(selected)
    }
    
    func setDisplay(b:Bool) {
        var animation: (() -> Void)!
        var completion: ((Bool) -> Void)?
        
        if b {
            var t0 = CGAffineTransformMakeScale(0.7, 0.7)
            animation = { () -> Void in
                self.transform = t0
            }
        } else {
            var t1 = CGAffineTransformIdentity
            animation = { () -> Void in
                self.transform = t1
            }
        }
        
        UIView.animateWithDuration(0.3,
            delay                   : 0.0,
            usingSpringWithDamping  : 0.6,
            initialSpringVelocity   : 1.0,
            options                 : UIViewAnimationOptions.CurveEaseIn,
            animations              : animation,
            completion              : completion)
    }
    
    func animateIn(delay:Double, indexPath:NSIndexPath) {
        let t0 = CGAffineTransformMakeTranslation((indexPath.row % 2 == 0 ? -1 : 1) * 100, 0)
        CGAffineTransformScale(t0, 0.8, 0.8)
        
        let t1 = CGAffineTransformMakeTranslation(0, 0)
        CGAffineTransformScale(t1, 1.0, 1.0)
        
        self.alpha = 0.3
        self.transform = t0
        
        UIView.animateWithDuration(0.7,
            delay                   : delay,
            usingSpringWithDamping  : 0.6,
            initialSpringVelocity   : 1.0,
            options                 : UIViewAnimationOptions.CurveEaseIn,
            animations              : { () -> Void in
                self.alpha = 1.0
                self.transform = t1
            },
            completion              : nil)
    }
    
    func animateOut(delay:Double, indexPath: NSIndexPath) {
        let t1 = CGAffineTransformMakeTranslation((indexPath.row % 2 == 0 ? -1 : 1) * 100, 0)
        CGAffineTransformScale(t1, 0.8, 0.8)
        
        UIView.animateWithDuration(0.7,
            delay                   : delay,
            usingSpringWithDamping  : 0.6,
            initialSpringVelocity   : 1.0,
            options                 : UIViewAnimationOptions.CurveEaseIn,
            animations              : { () -> Void in
                self.alpha = 0.3
                self.transform = t1
            },
            completion              : nil)
    }
    
}