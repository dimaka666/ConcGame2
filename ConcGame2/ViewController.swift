//
//  ViewController.swift
//  ConcGame2
//
//  Created by deus4 on 18.04.18.
//  Copyright © 2018 Test. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = Concentration()
    
    var flipCount = 0 {
        didSet {
           flipCountLabel.text = "Flips: \(flipCount)"
        }
    }
    
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices: Array<String> = ["😈","👹","💩","🤖","😈","👹","💩","🤖"]
    
    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.index(of: sender) {
            print("Card Number = \(cardNumber)")
            cardFlip(withEmoji: emojiChoices[cardNumber], on: sender)
        } else {
            print("Not in a list")
        }
    }

    
    func cardFlip(withEmoji emoji: String, on button: UIButton) {
        print("cardFlip(withEmoji: \(emoji))")
        
        if button.currentTitle == emoji {
            button.setTitle("", for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
        } else {
            button.setTitle(emoji, for: UIControlState.normal)
            button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}

