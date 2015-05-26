//
//  QuizController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/20/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit

extension Array{
    mutating func shuffle(){
        for _ in 0...alt.count-1 {
            sort { (_,_) in arc4random() < arc4random() }
        }
    }
}

var alt = ["a", "b", "c", "d"]


class QuizViewController:  UIViewController, UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate {
    
    @IBOutlet var question: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.question.editable = false
        self.question.text = "Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste? Pergunta Teste?"
        println("\(alt)")
        alt.shuffle()
        println("\(alt)")
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