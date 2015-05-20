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
    func salvarNoParse(classe:NSString){
        //Acho desnecessario esse metodo.
        
    }
    
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
//var relation = PFRelation().valueForKey(descricao as String)
        
        var query = PFQuery(className:classe as String)
        var array = [String]()
        
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
                            var aux = obj2["questao"]!
                            println("B:\(aux!)")
                            array.append(obj2["questao"]! as! String)
                        }
                
                    }
                }
                
                
                
                
                
                
                
             
            }
            
        }
        
        
        
        
        
    return array
        
    }


}