//
//  Song.swift
//  SetList
//
//  Created by Ryan D on 6/22/17.
//  Copyright © 2017 Ryan D. All rights reserved.
//

import UIKit

class Song {
    
    var name: String
    var artist: String
    var key: String
    var playCount: Int?
    var set: Set
    
    init?(name: String, artist: String, key: String, playCount: Int?, set: Set) {
        if name.isEmpty || artist.isEmpty || key.isEmpty {
            return nil
        }
        self.name = name
        self.artist = artist
        self.key = key
        self.playCount = playCount
        self.set = set
    }
    
}
