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

class ContainerViewController: UIViewController, CenterViewControllerDelegate, SideMenuViewControllerDelegate, UIGestureRecognizerDelegate {
    
    let centerPanelExpandedOffset:CGFloat = 60
    
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
        
        centerViewController = UIStoryboard.centerViewController()
        centerViewController.delegate = self
        
        centerNavigationController = MainNavigationController(rootViewController: centerViewController)
        view.addSubview(centerNavigationController.view)
        addChildViewController(centerNavigationController)
        
        centerNavigationController.didMoveToParentViewController(self)
        
        centerNavigationController.view.addGestureRecognizer(UIPanGestureRecognizer(target: self, action: "handlePanGesture:"))
    }
    
    func itemSelected(index: Int) {
        switch(currentState) {
        case .LeftPanelExpanded: toggleLeftPanel()
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
    
    var allowPanGesture = false
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
            recognizer.view!.center.x = recognizer.view!.center.x + recognizer.translationInView(view).x
            recognizer.setTranslation(CGPointZero, inView: view)
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
//                println("\(isInThreshold), \(hasEnoughVelocity)")
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
    
    class func rightViewController() -> SideMenuViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("RightViewController") as? SideMenuViewController
    }
    
    class func centerViewController() -> CenterViewController? {
        return mainStoryboard().instantiateViewControllerWithIdentifier("CenterViewController") as? CenterViewController
    }
}
