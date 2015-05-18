//
//  UIBaseCell.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/18/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import UIKit

protocol BaseAnimatableCell {
    
    func animateIn (delay:Double, indexPath:NSIndexPath)
    func animateOut(delay:Double, indexPath:NSIndexPath)
    
}