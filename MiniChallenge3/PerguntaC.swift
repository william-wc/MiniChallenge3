//
//  PerguntaC.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 26/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(PerguntaC)
class PerguntaC: NSManagedObject {
    @NSManaged var questao: String
    @NSManaged var resolucao: String
    @NSManaged var index: Int16
    @NSManaged var alternativas: NSData
    
    

    func convertToBinaryData(alts:[String]) -> NSData{
        
        let data = NSData(bytes: alts, length: alts.count * sizeof(String))
        
        return data
        
    }
    
    func convertToArray(data:NSData) -> [String]{
        let count = data.length / sizeof(String)
        
        var array = [AnyObject](count:count, repeatedValue: 0)
        
        data.getBytes(&array, length:count * sizeof(String))
    
        return array as! [String]
    }


}