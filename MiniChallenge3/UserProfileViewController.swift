//
//  UserProfileViewController.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

class UserProfileViewController: CenterViewController {
    
    @IBOutlet weak var graphView:UIView!
    
    private var graph = PieGraph()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        drawGraph()
    }
    
    func drawGraph() {
        graph.data = [10,30,25,35]
        graph.lineWidth = 20.0
        graph.radius = min(graphView.frame.width, graphView.frame.height) / 2.0 - graph.lineWidth
        graph.center = CGPoint(
            x: graphView.frame.width / 2,
            y: graphView.frame.height / 2
        )
        graph.lineCap = kCALineCapSquare
        graph.initialRadius = CGFloat(-M_PI_2)
        graph.strokeColors = [UIColor.redColor(), UIColor.greenColor()]
        graph.fillColor = UIColor.clearColor().CGColor
        graphView.layer.addSublayer(graph)
        
        graph.draw(true)
    }
    
    
}