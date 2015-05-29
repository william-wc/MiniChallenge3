//
//  Opcao.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class Opcao: NSManagedObject {

    @NSManaged var texto: String
    @NSManaged var relationship: PerguntaC

}
