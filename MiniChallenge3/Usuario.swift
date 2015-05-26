//
//  Usuario.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 26/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Usuario)
class Usuario: NSManagedObject {
    @NSManaged var nome: String
    @NSManaged var acertos: Int16
    @NSManaged var erros: Int16
}