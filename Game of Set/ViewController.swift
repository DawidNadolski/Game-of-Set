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
            game.getCardInfo(of: cardNumber)
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
            button.layer.borderWidth = 0.0
            var stringTitle = ""
            var shape = ""
            var color: UIColor = UIColor.clear
            
            if game.selectedCards.contains(game.cards[index]) {
                button.layer.cornerRadius = 15.0
                button.layer.borderWidth = 3.0
                button.layer.borderColor = UIColor.blue.cgColor
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
                print("ViewController/updateViewFromModel(): shape switch error")
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
                print("ViewController/updateViewFromModel(): count switch error")
            }
            
            let colorChoice = game.cards[index].color
            switch colorChoice {
            case 1:
                color = UIColor.red
            case 2:
                color = UIColor.yellow
            case 3:
                color = UIColor.green
            default:
                print("ViewController/updateViewFromModel(): color switch error")
            }
            
            var attributedStringTitle = NSAttributedString(string: "")
            let fillChoice = game.cards[index].fill
            switch fillChoice {
            case 1:
                attributedStringTitle = NSAttributedString(string: stringTitle, attributes: [.foregroundColor: color])
            case 2:
                attributedStringTitle = NSAttributedString(string: stringTitle, attributes: [.strokeWidth: 5.0, .foregroundColor: color])
            case 3:
                attributedStringTitle = NSAttributedString(string: stringTitle, attributes: [.strokeWidth: 5.0, .backgroundColor: color])
            default:
                print("ViewController/updateViewFromModel(): color switch error")
            }
                        
            button.setAttributedTitle(attributedStringTitle, for: UIControl.State.normal)
        }
    }
}

