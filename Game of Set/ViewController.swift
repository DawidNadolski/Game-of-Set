//
//  ViewController.swift
//  Game of Set
//
//  Created by Dawid Nadolski on 10/12/2019.
//  Copyright © 2019 Dawid Nadolski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var game = GameOfSet()
    
    @IBOutlet weak var dealThreeCardsButton: UIButton!
    @IBOutlet var cardButtons: [UIButton]!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        } else {
            print("Button is not in cardButtons")
        }
    }
    
    @IBAction func dealThreeCards(_ sender: UIButton) {
        game.visibleCards += 3
        updateViewFromModel()
        
        if game.visibleCards + 3 > 24 {
            dealThreeCardsButton.isEnabled = false
        } else {
            dealThreeCardsButton.isEnabled = true
        }
    }
    
    @IBAction func newGame(_ sender: UIButton) {
        game = GameOfSet()
        updateViewFromModel()
    }
    
    func updateViewFromModel() {
        for index in 0..<game.visibleCards {
            let button = cardButtons[index]
            button.layer.cornerRadius = 0.0
            var stringTitle = ""
            var shape = ""
            
            if game.selectedCards.contains(game.cards[index]) {
                button.layer.cornerRadius = 15.0
            }
            
            let shapeChoice = game.cards[index].shape
            switch shapeChoice {
            case 1:
                shape = "●"
            case 2:
                shape = "■"
            case 3:
                shape = "▲"
            default:
                print("ViewController_updateViewFromModel: shape switch error")
            }
            
            let countChoice = game.cards[index].count
            switch countChoice {
            case 1:
                stringTitle.append(shape)
            case 2:
                stringTitle.append(shape)
                stringTitle.append(shape)
            case 3:
                stringTitle.append(shape)
                stringTitle.append(shape)
                stringTitle.append(shape)
            default:
                print("ViewController_updateViewFromModel: count switch error")
            }
                     
            var attributedStringTitle = NSAttributedString(string: stringTitle) // To show shape of figure
            
            let colorChoice = game.cards[index].color
            switch colorChoice {
            case 1:
                button.setTitleColor(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), for: UIControl.State.normal)
            case 2:
                button.setTitleColor(#colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1), for: UIControl.State.normal)
            case 3:
                button.setTitleColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1), for: UIControl.State.normal)
            default:
                print("ViewController_updateViewFromModel: color switch error")
            }
            
            //let fill  = game.cards[index].fill
            
            button.setAttributedTitle(attributedStringTitle, for: UIControl.State.normal)
        }
    }
}

