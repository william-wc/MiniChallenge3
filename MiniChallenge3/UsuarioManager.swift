//
//  UsuarioManager.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 26/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData
import UIKit

public class UsuarioManager{
    static let sharedInstance:UsuarioManager = UsuarioManager()
    static let entityName:String = "Usuario"
    
    lazy var managedContext:NSManagedObjectContext = {
       var appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
       var c = appDelegate.managedObjectContext
        return c!
    }()
    
    private init(){}
    
    func novoUsuario()->Usuario
    {
        return NSEntityDescription.insertNewObjectForEntityForName(UsuarioManager.entityName, inManagedObjectContext: managedContext) as! Usuario
    }
    
    
}