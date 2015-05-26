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
    @NSManaged var alt1: String
    @NSManaged var alt2: String
    @NSManaged var alt3: String
    @NSManaged var alt4: String
    
}