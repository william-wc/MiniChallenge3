//
//  OpcaoManager.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData
import UIKit



public class OpcaoManager{
    static let sharedInstance:OpcaoManager = OpcaoManager()
    static let entityName:String = "Opcao"
    lazy var managedContext:NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var c = appDelegate.managedObjectContext
        return c!
        }()
    
    
    
    private init(){}
    
    func novaExata()->Opcao
    {
        return NSEntityDescription.insertNewObjectForEntityForName(OpcaoManager.entityName, inManagedObjectContext: managedContext) as! Opcao
    }
    
    func salvar()
    {
        var error:NSError?
        managedContext.save(&error)
        
        if let e = error {
            println("Could not save. Error: \(error), \(error!.userInfo)")
        }
    }
    
    func buscarMarcas()->Array<Opcao>
    {
        let fetchRequest = NSFetchRequest(entityName: OpcaoManager.entityName)
        var error:NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [Opcao] {
            return results
        } else {
            println("Could not fetch. Error: \(error), \(error!.userInfo)")
        }
        
        NSFetchRequest(entityName: "FetchRequest")
        
        
        return Array<Opcao>()
    }
    
    
}