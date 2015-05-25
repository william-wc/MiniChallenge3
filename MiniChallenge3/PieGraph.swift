//
//  PieGraph.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/21/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import UIKit
import QuartzCore

class PieGraph: CAShapeLayer {
    
    var data:[Double]!
    var center:CGPoint = CGPointZero
    var radius:CGFloat = 30
    var clockwise :Bool = true
    var initialRadius:CGFloat = 0
    var strokeColors:[UIColor]?
    var fillColors:[UIColor]?
    
    private var shapes:[CAShapeLayer] = []
    
    override init!() {
        super.init()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    /*
    Draw
    */
    func draw(animate:Bool) {
        clear()
        
        var total:Double = 0
        for i in 0...data.count-1 {
            total += data[i]
        }
        
        var sumP:CGFloat = 0
        
        for i in 0...data.count-1 {
            let p:CGFloat = CGFloat(data[i] / total)
            let path = UIBezierPath(
                arcCenter   : center,
                radius      : CGFloat(radius),
                startAngle  : initialRadius + CGFloat(2 * M_PI) * (sumP),
                endAngle    : initialRadius + CGFloat(2 * M_PI) * (sumP + p),
                clockwise   : clockwise)
            
            let pie = CAShapeLayer()
            pie.strokeColor = getColor(strokeColors, index: i)?.CGColor ?? self.strokeColor
            pie.fillColor   = getColor(fillColors, index: i)?.CGColor ?? self.fillColor
            pie.lineWidth   = self.lineWidth
            pie.lineCap     = self.lineCap
            pie.path        = path.CGPath
            pie.strokeEnd   = 1.0
            
            sumP += p
            self.addSublayer(pie)
            shapes.append(pie)
        }
        
        if animate {
            let time = CACurrentMediaTime()
            let duration:Double = 1.5
            var sumP:Double = 0
            
            for i in 0...shapes.count-1 {
                let shape = shapes[i]
                shape.strokeEnd = 0
                
                let p = (data[i] / total)
                let anim = CABasicAnimation(keyPath: "strokeEnd")
                anim.duration   = duration * p
                anim.beginTime  = time + duration * sumP
                anim.fromValue  = 0.0
                anim.toValue    = 1.0
                anim.fillMode   = kCAFillModeForwards
                anim.removedOnCompletion = false
                shapes[i].addAnimation(anim, forKey: "pie animation")
                
                sumP += p
            }
        }
    }
    
    func clear() {
        for shape:CAShapeLayer in shapes {
            shape.removeFromSuperlayer()
        }
        shapes = []
    }
    
    /*
    Utils
    */
    private func getColor(colors:[UIColor]?, index:Int) -> UIColor? {
        if colors != nil {
            let i:Int = index % colors!.count
            return colors![i]
        }
        return nil
    }
}