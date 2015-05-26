//
//  Exatas.swift
//  MiniChallenge3
//
//  Created by Bruno Faganello Neto on 26/05/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData
import UIKit

@objc(Exatas)
class Exatas: NSManagedObject {
    @NSManaged var descricao: String
    @NSManaged var linkImg: String
    @NSManaged var linkMateria: String
    @NSManaged var linkVideo: String
    @NSManaged var materia: String
    
}