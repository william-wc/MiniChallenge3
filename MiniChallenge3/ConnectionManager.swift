//
//  ConnectionManager.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

class ConnectionManager
{
   
    
    func readyOneCollOfOneTable(classe:NSString, coluna:NSString)->NSArray{
        
        var query = PFQuery(className:classe as String)
        var array = [String]()
        
        query.findObjectsInBackgroundWithBlock {
            
            (items: [AnyObject]?,erro: NSError?) -> Void in
    
            for i in 0 ... items!.count-1
            {
              var obj = items?[i] as! PFObject
                
                array.append(obj[coluna as String]! as! String)
                
            }
    
    }
    
        return array
    }
    
    
    
    func readyRelation(classe:NSString, coluna:NSString, descricao:NSString) -> NSArray{
        
        var query = PFQuery(className:classe as String)
        var array = [Pergunta]()
        var quest:String!
        var index:Int!
        var opcoes:[String]!
        var resp:String!
        
        query.findObjectsInBackgroundWithBlock {
            
            (items: [AnyObject]?,erro: NSError?) -> Void in
            
            for obj in items!
            {
                if(obj["descricao"]!!.isEqual(descricao) == true)
                {
                    var relation = obj.relationForKey("perguntas")
                    var cueri = relation.query()
                    
                    cueri!.findObjectsInBackgroundWithBlock {
                        (items2: [AnyObject]?,erro: NSError?) -> Void in
                        for obj2 in items2!{
                          quest = obj2["questao"] as! String
                          index = obj2["index"] as! Int
                          opcoes = obj2["opcoes"] as! [String]
                          resp = obj2["resolucao"]! as! String
                            
                            var p: Pergunta
                            p = Pergunta(t: quest, i: index, alt: opcoes, d: resp)
                            array.append(p)
                            
                            
                            

                            
                            
                        }
                
                    }
                }
                
                
                
                
                
                
                
             
            }
            
        }
        
        
        
        
        
    return array
        
    }


}