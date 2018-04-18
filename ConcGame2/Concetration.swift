//
//  Concetration.swift
//  ConcGame2
//
//  Created by Risovatel on 4/18/18.
//  Copyright © 2018 Test. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    
    func chooseCard(at index: Int){
        
    }
    
    init(numberOfPairsOfCards: Int) {
        for identifier in 1..<numberOfPairsOfCards {
            let card = Card(identifier: identifier)
            cards += [card, card]
        }
    }
}
