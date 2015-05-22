//
//  Pergunta.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 20/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
class Pergunta{
    
    var titulo: String!
    var indexResp: Int!
    var alternativas:[Int]!
    var descriResp: String!
    
    
    
    init(t:String, i:Int, alt:NSArray, d:String) {
        titulo = t
        indexResp = i
        alternativas = alt as! [(Int)]
        descriResp = d
    }
    
    
    
}
