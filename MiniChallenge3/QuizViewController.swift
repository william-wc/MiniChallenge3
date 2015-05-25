//
//  QuizController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/20/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

class QuizViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    var alt = ["a", "b", "c", "d"]
    
    @IBOutlet var question: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.editable = false
        self.question.text = "Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste?"
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! QuizCell
        cell.options.text = alt[indexPath.row]
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alt.count
    }

    
}