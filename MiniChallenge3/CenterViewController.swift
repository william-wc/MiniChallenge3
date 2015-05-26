//
//  CenterViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/12/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit


@objc
protocol CenterViewControllerDelegate {
    optional func toggleLeftPanel()
    optional func collapseSidePanels()
}

class CenterViewController: BaseUIViewController {
    
    var delegate: CenterViewControllerDelegate?
    var background:UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        background = UIImageView(frame: self.view.frame)
        background.backgroundColor = UIColor(patternImage: UIImage(named: "pattern 1")!)
        self.view.addSubview(background)
        self.view.sendSubviewToBack(background)
    }
    
}