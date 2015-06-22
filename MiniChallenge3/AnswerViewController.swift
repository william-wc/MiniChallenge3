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
    
    @IBOutlet var answer: UITextView!
    
    var data:Pergunta!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answer.editable = false
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.answer.text = data.descriResp
    }
    
}
