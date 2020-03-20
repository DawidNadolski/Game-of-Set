//
//  Card.swift
//  Game of Set
//
//  Created by Dawid Nadolski on 08/01/2020.
//  Copyright © 2020 Dawid Nadolski. All rights reserved.
//

import Foundation

struct Card: Equatable {
    
    var color: Int
    var shape: Int
    var count: Int
    var fill : Int
    
    init (color: Int, shape: Int, count: Int, fill: Int) {
        self.color = color
        self.shape = shape
        self.count = count
        self.fill  = fill
    }
}
