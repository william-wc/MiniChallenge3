//
//  Quiz.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class Quiz: NSManagedObject {

    @NSManaged var title: String
    @NSManaged var correctOption: NSNumber
    @NSManaged var options: NSSet

}
