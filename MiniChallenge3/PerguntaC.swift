//
//  PerguntaC.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class PerguntaC: NSManagedObject {

    @NSManaged var index: NSNumber
    @NSManaged var questao: String
    @NSManaged var resolucao: String
    @NSManaged var alternativas: NSSet
    @NSManaged var relationship: Exatas





    func addOpcao(opcao:Opcao){
        var opcoes = self.mutableSetValueForKey("opcoes")
        opcoes.addObject(opcao)
        
    }



}
