//
//  ViewController.swift
//  Concentration
//
//  Created by Idan Israel on 20/06/2019.
//  Copyright © 2019 Idan Israel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var flipCount = 0 { didSet { flipCountLabel.text = "Flips: \(flipCount)" } }
    var emojiChoices = ["👻", "🦇", "🦊", "🐙", "🥀", "🌞", "🍎", "🍩"]
    lazy var game = Concentration(numberOfPairsOfCards: (cardButtons.count + 1) / 2)
    var emoji = [Int:String]()
    
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var flipCountLabel: UILabel!
    
    
    @IBAction func touchCard(_ sender: UIButton)
    {
        if let cardNumber = cardButtons.firstIndex(of: sender)
        {
            if sender.backgroundColor !=  #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) && !game.cards[cardNumber].isMatched{ flipCount += 1 }
            
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        else { print("Chosen card was not in cardButtons") }
    }
    
    func updateViewFromModel()
    {
        for index in cardButtons.indices
        {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if card.isFaceUp
            {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor =  #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else
            {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 1, green: 0.4540326235, blue: 0.1953308823, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String
    {
        if emoji[card.identifier] == nil, emojiChoices.count > 0
        {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
        
    }
}

