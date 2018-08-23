//
//  Item.swift
//  Todoey
//
//  Created by Adilkhan khassanov on 8/10/18.
//  Copyright © 2018 Open Technologies Group. All rights reserved.
//

import Foundation
import RealmSwift

class Item: Object {
    @objc dynamic var title: String = ""
    @objc dynamic var done: Bool = false
    @objc dynamic var dateCreated: Date = Date()
    var parentCategory = LinkingObjects(fromType: Category.self, property: "items")
}
