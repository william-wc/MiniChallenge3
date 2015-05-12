//
//  ViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    
    @IBOutlet weak var avatar       : UIImageView!
    @IBOutlet weak var btnSubject   : UIButton!
    @IBOutlet weak var btnQuiz      : UIButton!
    @IBOutlet weak var btnProfile   : UIButton!
    
    /*
    
    */
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        super.prepareForSegue(segue, sender: sender)
        
    }
    
    /*
    Actions
    */
    
    @IBAction func onBtnSubject(sender: UIButton) {
    }
    
    @IBAction func onBtnQuiz(sender: UIButton) {
    }
    
    @IBAction func onBtnProfile(sender: UIButton) {
    }
    
    
    
}

