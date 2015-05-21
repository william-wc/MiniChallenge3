//
//  Materia.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 20/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation

class Materia {
    

var descricao: String!
var materia: String!
var linkMateria: String!
var linkVideo: String!
var imagem: UIImage!

    init(d:String,m:String,lm:String,lv:String){
        descricao = d
        materia = m
        linkMateria = lm
        linkVideo = lv
    }
    
    func setImage(img:UIImage){
        imagem = img
    }
}