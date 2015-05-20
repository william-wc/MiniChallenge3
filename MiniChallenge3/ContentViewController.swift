//
//  ContentViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/17/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class ContentViewController: CenterViewController {
    
    private let anim_transition_duration = 0.5
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    @IBOutlet weak var container: UIView!
    
    var mudar:String!
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
        
        println(self.navigationController?.viewControllers.count)
        
        setupRootContainerView(0)
        println(self.navigationController?.viewControllers.count)
        parse()
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
            duration        : anim_transition_duration,
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
    
    func parse(){
        var query = PFQuery(className:"Exatas")
        
        
        
        query.findObjectsInBackgroundWithBlock {
            
            (items: [AnyObject]?,erro: NSError?) -> Void in
            
            var y = items?[0] as! PFObject
            
            for i in 0 ... items!.count-1
                
            {
                
                var obj = items![i] as! PFObject
                
                if((obj["descricao"]?.isEqual(self.mudar)) == true){
                    var p = obj["materia"]
                    println("\(p!)")
                }
            }
        }
        
    }
    
    /*
    Action / Event
    */
    @IBAction func onSegmentChanged(sender: UISegmentedControl) {
        transitionViews(views[sender.selectedSegmentIndex])
    }
    
    
}
