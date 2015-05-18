//
//  ContentViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/17/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class ContentViewController: CenterViewController {
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var container: UIView!
    
    private var views:[UIViewController]!
    private var currentVC:UIViewController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        views = [
            storyboard.instantiateViewControllerWithIdentifier("Content1ViewController") as! UIViewController,
            storyboard.instantiateViewControllerWithIdentifier("Content2ViewController") as! UIViewController,
            storyboard.instantiateViewControllerWithIdentifier("Content3ViewController") as! UIViewController
        ]
        
        setupRootContainerView(0)
    }
    
    private func setupRootContainerView(index:Int) {
        let toVC = views[index]
        toVC.view.frame = container.bounds
        toVC.willMoveToParentViewController(self)
        addChildViewController(toVC)
        container.addSubview(toVC.view)
        toVC.didMoveToParentViewController(self)
        currentVC = toVC
    }
    
    func transitionViews(toVC:UIViewController) {
        if currentVC == toVC {
            return
        }
        
        self.segmentedControl.userInteractionEnabled = false
        
        let fromVC = currentVC
        let i = find(views, fromVC), j = find(views, toVC)
        let signal:CGFloat = i > j ? -1 : 1
        var t0 = CGAffineTransformMakeTranslation( signal * self.view.frame.width, 0)
        t0 = CGAffineTransformScale(t0, 0.7, 0.7)
        var t1 = CGAffineTransformMakeTranslation(-signal * self.view.frame.width, 0)
        t1 = CGAffineTransformScale(t1, 0.7, 0.7)
        
        toVC.view.frame = container.bounds
        toVC.view.transform = t0
        
        fromVC.willMoveToParentViewController(nil)
        addChildViewController(toVC)
        
        self.transitionFromViewController(
            currentVC,
            toViewController: toVC,
            duration        : 0.5,
            options         : UIViewAnimationOptions.CurveEaseOut,
            animations      : { () -> Void in
                toVC.view.transform = CGAffineTransformIdentity
                fromVC.view.transform = t1
            },
            completion      : { (b:Bool) -> Void in
                fromVC.view.removeFromSuperview()
                fromVC.removeFromParentViewController()
                
                toVC.view.transform = CGAffineTransformIdentity
                fromVC.view.transform = CGAffineTransformIdentity
                
                self.currentVC = toVC
                toVC.didMoveToParentViewController(self)
                self.segmentedControl.userInteractionEnabled = true
        })
        
    }
    
    /*
    Action / Event
    */
    @IBAction func onSegmentChanged(sender: UISegmentedControl) {
        transitionViews(views[sender.selectedSegmentIndex])
    }
    
    
}
