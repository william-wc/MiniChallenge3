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
    static var file:AnyObject?
    static var image:UIImage!
    
    class func readyOneCollOfOneTable(classe:NSString, coluna:NSString,onComplete:([String])->Void){
        
        var query = PFQuery(className:classe as String)
        var array = [String]()
        
        query.findObjectsInBackgroundWithBlock {
            
            (items: [AnyObject]?,erro: NSError?) -> Void in
    
            for i in 0 ... items!.count-1
            {
              var obj = items?[i] as! PFObject
                array.append(obj[coluna as String]! as! String)
            }
            
            onComplete(array)
        }
        
    }
    
    class func readyMateria(classe:NSString, onComplete:([Materia])->Void) {
        var query = PFQuery(className:classe as String)
        var array = [Materia]()
        
        query.findObjectsInBackgroundWithBlock {
            
            (items: [AnyObject]?,erro: NSError?) -> Void in
            
            var cont = 0
            
            for i in 0 ... items!.count-1
            {
                let obj = items?[i] as! PFObject
                let m = Materia()
                m.descricao   = obj["descricao"] as? String
                m.materia     = obj["materia"] as? [String]
                m.linkMateria = (obj["linkMateria"] as? [String])!
                m.linkVideo   = (obj["linkVideo"] as? [String])!
                m.imagemURL   = obj["linkImg"] as? String
//                println(m.descricao)
                self.readyPergunta(classe, descricao: m.descricao, onComplete: { (pergunta) -> Void in
                    
                    m.perguntas = pergunta
//                    println(m.perguntas)

                    array.append(m)
                    cont++
                    if(cont >= items!.count) {
                        let sortedArray = sorted(array, {
                            (str1: Materia, str2: Materia) -> Bool in
                            return str1.descricao < str2.descricao
                        })
                        
                        
                        onComplete(sortedArray)
                    }
                    
                })
            }
        }
    }
    
    class func readyPergunta(classe:NSString,descricao:NSString, onComplete:([Pergunta])->Void) {
        var query = PFQuery(className:classe as String)
        var array = [Pergunta]()
        var quest:String!
        var index:Int!
        var opcoes:[Int]!
        var resp:String!
        var cont = 0
        
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
                        if items2 == nil || items2!.count == 0 {
                            onComplete(array)
                        }
                        for obj2 in items2! {
                            cont++
                            quest = obj2["questao"] as! String
                            index = obj2["index"] as! Int
                            opcoes = obj2["opcoes"] as! [Int]
                            resp = obj2["resolucao"]! as! String
                            
                            array.append(Pergunta(t: quest, i: index, alt: opcoes, d: resp))
                            
                            if(cont >= items2!.count) {
                                
                                let sortedArray = sorted(array, {
                                    (str1: Pergunta, str2: Pergunta) -> Bool in
                                    return str1.titulo < str2.titulo
                                })
                                onComplete(sortedArray)
                            
                            }
                        }
                    }

                }
            }
            

        }
    }
    
    
    
    
        
    class func readyImage(classe:NSString,descricao:NSString,materia:NSString,obj:Materia, onComplete:((data:NSData?, error:NSError?)->Void)?) -> Void{
      var query = PFQuery(className:classe as String)
        
        query.whereKey(descricao as String, containsString: materia as String)
        
        query.findObjectsInBackgroundWithBlock
        {
            (items: [AnyObject]?,erro: NSError?) -> Void in
        
            var obj = items?.first as! PFObject
            
            var file = obj["img"] as! PFFile
            
            file.getDataInBackgroundWithBlock({ (data, error) -> Void in
            onComplete?(data: data, error: error)

            })
        }
    }
}