//
//  Category.swift
//  MiniChallenge3
//
//  Created by William Hong Jun Cho on 5/11/15.
//  Copyright (c) 2015 William Hong Jun Cho. All rights reserved.
//

import Foundation
import CoreData

class Category: NSManagedObject {

    @NSManaged var name: String
    @NSManaged var summary: String
    @NSManaged var image: NSData
//    @NSManaged var categories: NSSet

}
