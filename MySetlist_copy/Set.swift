//
//  Set.swift
//  SetList
//
//  Created by Ryan D on 6/22/17.
//  Copyright © 2017 Ryan D. All rights reserved.
//

import UIKit

class Set {
    
    var name: String
    var setlist: [Song]
    
    init?(name: String, setlist: [Song]) {
        if name.isEmpty {
            return nil
        }
        self.name = name
        self.setlist = setlist
    }
    
}
