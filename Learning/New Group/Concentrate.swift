//
//  Concentrate.swift
//  Learning
//
//  Created by Juan Ochoa on 4/29/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import Foundation

class Concentrate
{
    // Static
    static var identifier = 0;

    // Properties
    var numberOfPairs: Int
    var cards : [Card]
    var cardAlreadyFlipped: Int?

    // Constructors
    init(numberOfPairs: Int) {
        self.numberOfPairs = numberOfPairs
        self.cardAlreadyFlipped = nil
        self.cards = [Card]()

        InitializeCards()
    }

    // Static methods
    static func GetUniqueCardIdentifier() -> Int
    {
        Concentrate.identifier += 1
        return Concentrate.identifier;
    }

    // Methods
    func InitializeCards()
    {
        for _ in 0 ..< self.numberOfPairs
        {
            let identifier = Concentrate.GetUniqueCardIdentifier()
            let card = Card(identifier)
            self.cards += [card, card]
        }
    }

    func FlipCard(cardNumber: Int)
    {
        if cards[cardNumber].isMatched
        {
            return
        }
        
        if let cardAlreadyFlipped = self.cardAlreadyFlipped, cardAlreadyFlipped != cardNumber
        {
            if cards[cardAlreadyFlipped].identifier == cards[cardNumber].identifier
            {
                cards[cardNumber].isMatched = true
                cards[cardAlreadyFlipped].isMatched = true
            }

            cards[cardNumber].isFlipped = true
            cards[cardAlreadyFlipped].isFlipped = true

            self.cardAlreadyFlipped = nil
        }
        else
        {
            for card in cards.indices
            {
                cards[card].isFlipped = false
            }

            cards[cardNumber].isFlipped = true
            self.cardAlreadyFlipped = cardNumber
        }
    }

    func RestartGame()
    {
        self.InitializeCards()
    }
}
