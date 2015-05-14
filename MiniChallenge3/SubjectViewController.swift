//
//  SubjectViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class SubjectViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var subjects:[AnyObject] = []
    
    
    /*
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clearColor()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    /*
    Delegate
    */
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SubjectCell
        var idx = indexPath.row + 1
        idx = min(idx, 4)
        idx = max(idx, 0)
        cell.image.image = UIImage(named: "subject \(idx)")
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let t0 = CGAffineTransformMakeTranslation((indexPath.row % 2 == 0 ? -1 : 1) * 100, 0)
        CGAffineTransformScale(t0, 0.8, 0.8)
        
        let t1 = CGAffineTransformMakeTranslation(0, 0)
        CGAffineTransformScale(t1, 1.0, 1.0)
        
        cell.alpha = 0.3
        cell.transform = t0
        
        UIView.animateWithDuration(0.7,
            delay                   : 0.5,
            usingSpringWithDamping  : 0.6,
            initialSpringVelocity   : 1.0,
            options                 : UIViewAnimationOptions.CurveEaseIn,
            animations              : { () -> Void in
                cell.alpha = 1.0
                cell.transform = t1
            },
            completion              : nil)
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        let t0 = CGAffineTransformMakeScale(0.7, 0.7)
        UIView.animateWithDuration(0.3,
            delay                   : 0.0,
            usingSpringWithDamping  : 0.6,
            initialSpringVelocity   : 1.0,
            options                 : UIViewAnimationOptions.CurveEaseIn,
            animations              : { () -> Void in
                cell.transform = t0
            },
            completion              : nil)
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath)!
        let t1 = CGAffineTransformMakeScale(1.0, 1.0)
        UIView.animateWithDuration(0.3,
            delay                   : 0.0,
            usingSpringWithDamping  : 0.6,
            initialSpringVelocity   : 1.0,
            options                 : UIViewAnimationOptions.CurveEaseIn,
            animations              : { () -> Void in
                cell.transform = t1
            },
            completion              : nil)
    }
    
    var lastOffset = CGPoint(x: 0, y: 0)
    var lastTimeInterval:NSTimeInterval = 0
    var isScrolling:Bool = false
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        isScrolling = true
    }
    
    func scrollViewWillEndDragging(scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        isScrolling = false
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
    }
    
}