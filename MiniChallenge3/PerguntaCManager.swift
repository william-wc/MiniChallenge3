//
//  PerguntaCManager.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 26/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//


import Foundation
import CoreData
import UIKit

public class PerguntaCManager{
    static let sharedInstance:PerguntaCManager = PerguntaCManager()
    static let entityName:String = "PerguntaC"
    
    lazy var managedContext:NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var c = appDelegate.managedObjectContext
        return c!
        }()
    
    private init(){}
    
    func novaPergunta()->PerguntaC
    {
        return NSEntityDescription.insertNewObjectForEntityForName(PerguntaCManager.entityName, inManagedObjectContext: managedContext) as! PerguntaC
    }
    
    func salvar()
    {
        var error:NSError?
        managedContext.save(&error)
        
        if let e = error {
            println("Could not save. Error: \(error), \(error!.userInfo)")
        }
    }
    
    func buscarPerguntas()->Array<PerguntaC>
    {
        let fetchRequest = NSFetchRequest(entityName: PerguntaCManager.entityName)
        var error:NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [PerguntaC] {
            return results
        } else {
            println("Could not fetch. Error: \(error), \(error!.userInfo)")
        }
        
        NSFetchRequest(entityName: "FetchRequest")
        
        
        return Array<PerguntaC>()
    }
}