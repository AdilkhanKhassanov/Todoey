//
//  Category.swift
//  Todoey
//
//  Created by Adilkhan khassanov on 8/10/18.
//  Copyright © 2018 Open Technologies Group. All rights reserved.
//

import Foundation
import RealmSwift

class Category: Object {
    @objc dynamic var name: String = ""
    let items = List<Item>()
}
