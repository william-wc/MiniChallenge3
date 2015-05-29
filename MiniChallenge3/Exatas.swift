//
//  Exatas.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 29/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class Exatas: NSManagedObject {

    @NSManaged var descricao: String
    @NSManaged var linkImg: String
    @NSManaged var linkMateria: String
    @NSManaged var linkVideo: String
    @NSManaged var materia: String
    @NSManaged var contem: NSSet

    
    func addPergunta(pergunta:PerguntaC){
        var perguntas = self.mutableSetValueForKey("perguntas")
        perguntas.addObject(pergunta)
    }

    


}
