//
//  BaseUIViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/25/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class BaseUIViewController: UIViewController {
    
    var didAppear:Bool = false
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        self.didAppear = true
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        self.didAppear = false
    }
}
