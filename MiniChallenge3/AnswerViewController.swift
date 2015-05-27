//
//  AnswerViewController.swift
//  MiniChallenge3
//
//  Created by Victor Lisboa on 21/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit
import Foundation

class AnswerViewController: UIViewController {

    @IBAction func nextQ(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet var answer: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answer.editable = false
        self.answer.text = "Errou, poderia ter se esforçado mais"

        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
