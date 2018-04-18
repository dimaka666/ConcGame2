//
//  Card.swift
//  ConcGame2
//
//  Created by Risovatel on 4/18/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    init(identifier: Int) {
        self.identifier = identifier
    }
    
}
