//
//  Card.swift
//  Concentration
//
//  Created by Idan Israel on 20/06/2019.
//  Copyright © 2019 Idan Israel. All rights reserved.
//

import Foundation

struct Card
{
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    init() { self.identifier = Card.getUniqueIdentifier() }
    
    static func getUniqueIdentifier() -> Int
    {
        identifierFactory += 1
        return identifierFactory
    }
}
