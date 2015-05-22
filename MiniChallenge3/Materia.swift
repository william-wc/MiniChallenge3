//
//  Materia.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 20/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

class Materia {
    

    var descricao   : String!
    var materia     : [String]!
    var linkMateria : [String]!
    var linkVideo   : [String]!
    var imagemURL   : String!

    init(descricao:String, materia:[String], linkMateria:[String], linkVideo:[String], imagemURL:String) {
        self.descricao      = descricao
        self.materia        = materia
        self.linkMateria    = linkMateria
        self.linkVideo      = linkVideo
        self.imagemURL      = imagemURL
    }
    
}