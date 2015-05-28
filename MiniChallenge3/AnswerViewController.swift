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
    var resp = ["Para resolver a soma dos dois numeros basta apenas utilizar o simples conceito de soma sendo 1 adicionado a outro 1","O iPhone, criado em 2007 por Steve Jobs, até então presidente da Apple", "O desenvolvedor dessas perguntas nasceu no ano de 1994, logo tem \"2015-1994\" que é um total de 21 anos", "Para calcular a derivada do x, basta \"jogar\" o expoente do x (1), multiplicando-o e trocando para 0, logo, será 1"]
    var index = Int()
    
    @IBAction func nextQ(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    @IBOutlet var answer: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.answer.editable = false
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(animated: Bool) {
        self.answer.text = resp[index]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
