//
//  ConnectionManager.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

class ConnectionManager {
    
    static var file:AnyObject?
    static var image:UIImage!
    
    class func readyOneCollOfOneTable(classe:NSString, coluna:NSString)->[String] {
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
    
    class func readyMateria(classe:NSString, onComplete:([Materia])->Void) {
        var query = PFQuery(className:classe as String)
        
        query.findObjectsInBackgroundWithBlock {
            (items: [AnyObject]?,erro: NSError?) -> Void in
            
            var array       = [Materia]()
            var descricao   :String!
            var materia     :[String]!
            var linkM       :[String]!
            var linkV       :[String]!
            var imgURL      :String!
            
            for i in 0 ... items!.count-1
            {
                var obj     = items?[i] as! PFObject
                descricao   = obj["descricao"] as! String
                materia     = obj["materia"] as! [String]
                linkM       = obj["linkMateria"] as! [String]
                linkV       = obj["linkVideo"] as! [String]
                imgURL      = obj["linkImg"] as! String
             
                var m: Materia = Materia(
                    descricao   : descricao,
                    materia     : materia,
                    linkMateria : linkM,
                    linkVideo   : linkV,
                    imagemURL   : imgURL)
                array.append(m)
            }
            
            onComplete(array)
        }
    }
    
    class func readyPergunta(classe:NSString,descricao:NSString) -> [Pergunta] {
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
                if(obj["descricao"]!!.isEqual(descricao))
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
    
    class func readyImage(classe:NSString, descricao:NSString, materia:NSString, obj:Materia, onComplete:((data:NSData?, error:NSError?)->Void)?) -> Void{
        var query = PFQuery(className:classe as String)
        
        query.whereKey(descricao as String, containsString: materia as String)
        query.findObjectsInBackgroundWithBlock {
            (items: [AnyObject]?,erro: NSError?) -> Void in
        
            var popey = items?.first as! PFObject
            
            var pratofeitofile = popey["img"] as! PFFile
            
            pratofeitofile.getDataInBackgroundWithBlock({ (data, error) -> Void in
            onComplete?(data: data, error: error)
                
            })
        }
    }
}