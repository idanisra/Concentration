//
//  Concentration.swift
//  Concentration
//
//  Created by Idan Israel on 20/06/2019.
//  Copyright © 2019 Idan Israel. All rights reserved.
//

import Foundation

class Concentration
{
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    func chooseCard(at index: Int)
    {
        if !cards[index].isMatched
        {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index
            {
                if cards[matchIndex].identifier == cards[index].identifier
                {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }
            else
            {
                for flipDownIndex in cards.indices { cards[flipDownIndex].isFaceUp = false }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
    
    init (numberOfPairsOfCards: Int)
    {
        for _ in 1...numberOfPairsOfCards
        {
            let card = Card()
            cards += [card, card]
        }
        var tempChoices = [Card]()
        
        for _ in 0..<(cards.count)
        {
            let randomIndex = Int(arc4random_uniform(UInt32(cards.count)))
            tempChoices.append(cards.remove(at: randomIndex))
        }
        
        cards = tempChoices
    }
}
