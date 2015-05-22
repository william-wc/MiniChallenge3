//
//  SubjectViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class SubjectViewController: CenterViewController, UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate {
    
    let SegueToSubjectCategory = "segue"
    
    private let anim_delay = 0.5
    private let anim_cell_delay = 0.13
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    private var didAppear:Bool = false
    private var subjects:[AnyObject] = []
    private var selectedIndex = -1
    
    /*
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.backgroundColor = UIColor.clearColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        didAppear = false
        collectionView.reloadData()
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        didAppear = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        collectionViewHideCells()
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == SegueToSubjectCategory {
            let destination = segue.destinationViewController as! SubjectCategoryViewController
            destination.SubjectKey = Config.SubjectKeys[selectedIndex]
        }
    }
    
    /*
    Actions
    */
    @IBAction func onTapMenu(sender: UIBarButtonItem) {
        self.delegate?.toggleLeftPanel?()
    }
    
    /*
    Delegate / DataSource
    */
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Config.ButtonNames.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("cell", forIndexPath: indexPath) as! SubjectCell
        cell.text.text = Config.ButtonNames[indexPath.row]
        cell.image.image = Config.ButtonImages[indexPath.row]
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, willDisplayCell cell: UICollectionViewCell, forItemAtIndexPath indexPath: NSIndexPath) {
        let delay = didAppear ? 0.0 : anim_delay + anim_cell_delay * Double(Int(indexPath.row / 2))
        (cell as! SubjectCell).animateIn(delay, indexPath: indexPath)
    }
    
    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! SubjectCell
        cell.setHighlight(true)
    }
    
    func collectionView(collectionView: UICollectionView, didUnhighlightItemAtIndexPath indexPath: NSIndexPath) {
        let cell = collectionView.cellForItemAtIndexPath(indexPath) as! SubjectCell
        cell.setHighlight(false)
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        self.selectedIndex = indexPath.row
        self.performSegueWithIdentifier(SegueToSubjectCategory, sender: self)
    }
    
    func collectionViewHideCells() {
        let paths = collectionView.indexPathsForVisibleItems() as! [NSIndexPath]
        for i:Int in 0...paths.count-1 {
            var path = paths[i]
            var cell = collectionView.cellForItemAtIndexPath(path) as! BaseAnimatableCell
            var delay = anim_cell_delay * Double(Int(i / 2))
            cell.animateOut(delay, indexPath: path)
        }
    }
    
}