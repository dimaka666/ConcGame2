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
    
    var flipCount = 0
    
    var matchedCount = 0
    
    var bestTry = 0
    
    var finished = false
    
    var indexOfFirstFacedUp: Int? {
        get {
            var foundIndex: Int?
            for index in cards.indices {
                if cards[index].isFaceUp {
                    if foundIndex == nil {
                        foundIndex = index
                    } else {
                        return nil
                    }
                }
            }
            return foundIndex
        }
        set {
            for index in cards.indices {
                cards[index].isFaceUp = (index == newValue)
            }
        }
    }
    
    func chooseCard(at index: Int){
        if !cards[index].isMatched {
            flipCount += 1
            if let matchIndex = indexOfFirstFacedUp, matchIndex != index {
                //check if cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[index].isMatched = true
                    cards[matchIndex].isMatched = true
                    matchedCount += 1
                }
                cards[index].isFaceUp = true
            } else {
                indexOfFirstFacedUp = index;
            }
        }
        print("cards count: \(cards.count)")
        print("matched count: \(matchedCount)")
        
        if ((cards.count / 2) - matchedCount) == 0 {
            finished = true
            if bestTry == 0 {
                bestTry = flipCount
            } else {
                if bestTry > flipCount {
                    bestTry = flipCount
                }
            }
        }
    }
    
    init(numberOfPairsOfCards: Int) {
        cards = []
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
            cards += [card, card]
        }
        //TODO: Shuffle the cards
        for _ in 0...(cards.count * 2) {
            let r = Int(arc4random_uniform(UInt32(cards.indices.count)))
            let rr = Int(arc4random_uniform(UInt32(cards.indices.count)))
            cards.swapAt(r, rr)
        }
        
    }
}
