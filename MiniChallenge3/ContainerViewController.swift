//
//  ContainerViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/12/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

enum SlideOutState {
    case Collapsed
    case LeftPanelExpanded
}

class ContainerViewController: UIViewController, CenterViewControllerDelegate, SideMenuViewControllerDelegate, UIGestureRecognizerDelegate, UINavigationControllerDelegate {
    
    let centerPanelExpandedOffset:CGFloat = 60
    let transitionManager:TransitionManager = TransitionManager()

    var centerNavigationController: UINavigationController!
    var centerViewController: CenterViewController!
    var leftViewController:SideMenuViewController?
    
    var currentState: SlideOutState = .Collapsed {
        didSet {
            let shouldShowShadow = currentState != .Collapsed
            showShadowForCenterViewController(shouldShowShadow)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        centerViewController = UIStoryboard.subjectViewController()
        centerViewController.delegate = self
        
        centerNavigationController = MainNavigationController(rootViewController: centerViewController)
        centerNavigationController.delegate = self
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        centerNavigationController.didMoveToParentViewController(self)
        centerNavigationController.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "handlePanGesture:"))
    }
    
    func addLeftPanelViewController() {
        if leftViewController == nil {
            leftViewController = UIStoryboard.leftViewController()
        }
        
        let vc = leftViewController!
        leftViewController!.delegate = self
        view.insertSubview(vc.view, atIndex: 0)
        addChildViewController(vc)
        vc.didMoveToParentViewController(self)
    }
    
    func animateLeftPanel(#shouldExpand: Bool) {
        if shouldExpand {
            currentState = .LeftPanelExpanded
            var position = CGRectGetWidth(centerNavigationController.view.frame) - centerPanelExpandedOffset
            
            UIView.animateWithDuration(
                0.5,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: UIViewAnimationOptions.CurveEaseInOut,
                animations: { () -> Void in
                    self.centerNavigationController.view.frame.origin.x = position
                },
                completion: nil
            )
        } else {
            UIView.animateWithDuration(
                0.5,
                delay: 0,
                usingSpringWithDamping: 0.8,
                initialSpringVelocity: 0,
                options: UIViewAnimationOptions.CurveEaseInOut,
                animations: { () -> Void in
                    self.centerNavigationController.view.frame.origin.x = 0
                },
                completion: { (b:Bool) -> Void in
                    self.currentState = .Collapsed
                    self.leftViewController!.view.removeFromSuperview()
                    self.leftViewController = nil
                }
            )
        }
    }
    
    func showShadowForCenterViewController(shouldShowShadow:Bool) {
        centerNavigationController.view.layer.shadowOpacity = shouldShowShadow ? 0.8 : 0.0
    }
    
    func navigationController(navigationController: UINavigationController, animationControllerForOperation operation: UINavigationControllerOperation, fromViewController fromVC: UIViewController, toViewController toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        //checking animation direction
        switch operation {
        case .Pop   : transitionManager.presenting = false
        case .Push  : transitionManager.presenting = true
        default     : return nil
        }
        return transitionManager
    }

    
    /*
    Delegate
    */
    func itemSelected(index: Int) {
        switch(currentState) {
        case .LeftPanelExpanded: toggleLeftPanel()
        default: break
        }
        
        switch(index) {
        case 0: self.centerNavigationController.popToRootViewControllerAnimated(true)
        case 1:
            let nextScreen = UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier("UserProfileViewController") as! UIViewController
            self.centerNavigationController.pushViewController(nextScreen, animated: true)
        case 2:
            let nextScreen = UIStoryboard.mainStoryboard().instantiateViewControllerWithIdentifier("QuizListViewController") as! UIViewController
            self.centerNavigationController.pushViewController(nextScreen, animated: true)
        default: break
        }
    }
    
    func toggleLeftPanel() {
        let isExpanded = (currentState == .LeftPanelExpanded)
        
        if !isExpanded {
            addLeftPanelViewController()
        }
        
        animateLeftPanel(shouldExpand: !isExpanded)
    }
    
    /*
    Action / Event
    */
    
    func handlePanGesture(recognizer:UIPanGestureRecognizer) {
        let gestureIsDraggingFromLeftToRight = recognizer.velocityInView(view).x > 0

        switch(recognizer.state) {
        case .Began:
            if currentState == .Collapsed {
                if gestureIsDraggingFromLeftToRight {
                    addLeftPanelViewController()
                }
                showShadowForCenterViewController(true)
            }
        case .Changed:
            if leftViewController != nil {
                //limiting panning
                var vx = (recognizer.view!.center.x + recognizer.translationInView(view).x)
                vx = max(vx, 0.5 * view.frame.width)
                vx = min(vx, 1.5 * view.frame.width - centerPanelExpandedOffset)
                
                recognizer.view!.center.x = vx
                recognizer.setTranslation(CGPointZero, inView: view)
                
                //percentage of progress
//                var px = recognizer.view!.center.x + recognizer.translationInView(view).x
//                px -= 0.5 * view.frame.width
//                px /= view.frame.width - centerPanelExpandedOffset
            }
            break
        case .Ended:
            if leftViewController != nil {
                let isInThreshold = recognizer.view!.center.x > view.bounds.size.width
                let hasEnoughVelocity = abs(recognizer.velocityInView(view).x) > 300
                
                switch currentState {
                case .Collapsed:
                    animateLeftPanel(shouldExpand: isInThreshold || hasEnoughVelocity)
                    break
                case .LeftPanelExpanded:
                    animateLeftPanel(shouldExpand: !(!isInThreshold || hasEnoughVelocity))
                    break
                default:
                    break
                }
            }
            break
        default:
            break
        }
    }
    
}

private extension UIStoryboard {
    class func mainStoryboard() -> UIStoryboard {
        return UIStoryboard(name: "Main", bundle: NSBundle.mainBundle())
    }
    
    class func leftViewController() -> SideMenuViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SideMenuViewController") as? SideMenuViewController
    }
    
    class func centerViewController() -> CenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
    }
    
    class func subjectViewController() -> SubjectViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("SubjectViewController") as? SubjectViewController
    }
    
    class func contentViewController() -> ContentViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("ContentViewController") as? ContentViewController
    }
}
