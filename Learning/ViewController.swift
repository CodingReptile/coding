//
//  ViewController.swift
//  Learning
//
//  Created by Juan Ochoa on 4/25/18.
//  Copyright © 2018 Juan Ochoa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    lazy var game = Concentrate(numberOfPairs: (UICards.count + 1) / 2)
    
    @IBOutlet var UICards: [UIButton]!

    @IBAction func touchCard(_ sender: UIButton) {

        game.FlipCard(cardNumber: UICards.index(of: sender)!)
        PrintUI()
    }

    var emoticons = ["👻", "🎃", "🍎", "🍑", "♥️", "⚽️", "🏆", "🍕", "🍊"]

    func PrintUI()
    {
        for cardNumber in UICards.indices
        {
            let modelCard = game.cards[cardNumber]
            let uiCard = self.UICards[cardNumber]

            if modelCard.isMatched
            {
                uiCard.setTitle(emoticons[modelCard.identifier], for: UIControlState.normal)
                uiCard.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
            }
            else if modelCard.isFlipped
            {
                uiCard.setTitle(emoticons[modelCard.identifier], for: UIControlState.normal)
                uiCard.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            }
            else
            {
                uiCard.setTitle("", for: UIControlState.normal)
                uiCard.backgroundColor = #colorLiteral(red: 1, green: 0.5722769353, blue: 0.2879855959, alpha: 1)
            }

        }
    }
    
}

