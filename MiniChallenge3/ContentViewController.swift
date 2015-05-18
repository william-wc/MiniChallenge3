//
//  ContentViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/17/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class ContentViewController: UIViewController,UIWebViewDelegate{
    
    
    @IBOutlet weak var label: UILabel!
    var mudar:String!
    //var webView:UIWebView!
    
    @IBOutlet weak var webView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        
        self.label.text = mudar;
        self.parse()
        
//        NSURL *url = [NSURL URLWithString:@"http://www.youtube.com/watch?v=fDXWW5vX-64"];
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        [self.webView loadRequest:request];
        
        
        
        
        
        
    }
    
    
    func parse(){
        var query = PFQuery(className:"Exatas")
        
        
        
        query.findObjectsInBackgroundWithBlock {
            
            (items: [AnyObject]?,erro: NSError?) -> Void in
            
            
            
            var y = items?[0] as! PFObject
            
            for i in 0 ... items!.count-1
                
            {
                
                var obj = items![i] as! PFObject
                
                if((obj["descricao"]?.isEqual(self.mudar)) == true){
                
                    var p = obj["materia"]
                    
                    println("\(p!)")
                    //Eu sou viadão.
                
                
                
                }
            
            }
        
        
    
    
        }

    }

}
