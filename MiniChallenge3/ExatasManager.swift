//
//  ExatasManager.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 26/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class ExatasManager{
    static let sharedInstance:ExatasManager = ExatasManager()
    static let entityName:String = "Exatas"
    
    lazy var managedContext:NSManagedObjectContext = {
        var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        var c = appDelegate.managedObjectContext
        return c!
        }()
    
    private init(){}
    
    func novaExata()->Exatas
    {
        return NSEntityDescription.insertNewObjectForEntityForName(ExatasManager.entityName, inManagedObjectContext: managedContext) as! Exatas
    }
    
    func salvar()
    {
        var error:NSError?
        managedContext.save(&error)
        
        if let e = error {
            println("Could not save. Error: \(error), \(error!.userInfo)")
        }
    }
    
    func buscarExatas()->Array<Exatas>
    {
        let fetchRequest = NSFetchRequest(entityName: ExatasManager.entityName)
        var error:NSError?
        
        let fetchedResults = managedContext.executeFetchRequest(fetchRequest, error: &error) as? [NSManagedObject]
        
        if let results = fetchedResults as? [Exatas] {
            return results
        } else {
            println("Could not fetch. Error: \(error), \(error!.userInfo)")
        }
        
        NSFetchRequest(entityName: "FetchRequest")
        
        
        return Array<Exatas>()
    }
    
    
    
    
}