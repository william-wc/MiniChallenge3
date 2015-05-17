//
//  TransitionManager.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/17/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class TransitionManager: NSObject, UIViewControllerAnimatedTransitioning, UIViewControllerTransitioningDelegate {
    
    var maskBaseView:UIView = UIView()
    var transitionContext:UIViewControllerContextTransitioning?
    var presenting = true

    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        
        let container   = transitionContext.containerView()
        let fromView    = transitionContext.viewForKey(UITransitionContextFromViewKey)!
        let toView      = transitionContext.viewForKey(UITransitionContextToViewKey)!
        let duration    = self.transitionDuration(transitionContext)
        
        container.addSubview(toView)
        //container.addSubview(fromView)
        
        var frame = container.frame
        var p1 = CGPoint(x: frame.width, y: frame.height / 2)
        var p2 = CGPoint(x: frame.origin.x, y: frame.height / 2)
        var maskStart = UIBezierPath(arcCenter: presenting ? p1 : p2,
            radius: CGFloat(30),
            startAngle: 0.01,
            endAngle: 0.00,
            clockwise: true)
        var maskEnd = UIBezierPath(arcCenter: presenting ? p1 : p2,
            radius: CGFloat(sqrt(frame.width * frame.width + (frame.height / 2) * (frame.height / 2))),
            startAngle: 0.01,
            endAngle: 0.00,
            clockwise: true)
        
        var maskLayer = CAShapeLayer()
        maskLayer.path = maskEnd.CGPath
        toView.layer.mask = maskLayer
        
        var group = CAAnimationGroup()
        group.animations = []
        group.delegate = self
        group.duration = duration
        
        var anim = CABasicAnimation(keyPath: "path")
        anim.fromValue = maskStart.CGPath
        anim.toValue = maskEnd.CGPath
        group.animations.append(anim)
        
        maskLayer.addAnimation(group, forKey: "mask path")
    }
    
    override func animationDidStop(anim: CAAnimation!, finished flag: Bool) {
        self.transitionContext?.completeTransition(true)
        self.transitionContext?.viewForKey(UITransitionContextToViewKey)!.layer.mask = nil
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning) -> NSTimeInterval {
        return 0.7
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = true
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.presenting = false
        return self
    }

}