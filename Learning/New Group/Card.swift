//
//  Card.swift
//  Learning
//
//  Created by Juan Ochoa on 4/29/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation

struct Card {
    var isFlipped = false
    var isMatched = false
    var identifier : Int

    init (_ identifier: Int)
    {
        self.identifier = identifier
    }
}
