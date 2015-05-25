//
//  Content1Cell.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/20/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class Content1Cell: UITableViewCell, BaseAnimatableCell {
    
    let anim_duration = 0.2
    
    @IBOutlet weak var contentImage:UIImageView?
    @IBOutlet weak var contentText:UILabel?
    
    func animateIn(delay: Double, indexPath: NSIndexPath) {
        var t0 = CGAffineTransformMakeTranslation(0, 30)
        CGAffineTransformScale(t0, 0.7, 0.7)
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
    
    func animateOut(delay: Double, indexPath: NSIndexPath) {
        var t1 = CGAffineTransformMakeTranslation(0, 30)
        CGAffineTransformScale(t1, 0.7, 0.7)
        
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