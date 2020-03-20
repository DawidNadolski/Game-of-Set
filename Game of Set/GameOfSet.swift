//
//  GameOfSet.swift
//  Game of Set
//
//  Created by Dawid Nadolski on 11/12/2019.
//  Copyright © 2019 Dawid Nadolski. All rights reserved.
//

import Foundation

class GameOfSet {
    
    var selectedCards = [Card]()
    var cards = [Card]()
    var visibleCards = 12;
    
    func chooseCard(at index: Int) {
        let card = cards[index]
        
        if selectedCards.contains(card) {
            if let indexOfSelectedCard = selectedCards.firstIndex(of: card) {
                selectedCards.remove(at: indexOfSelectedCard)
            } else {
                print("GameOfSet_chooseCard: removing selection error")
            }
        } else {
            selectedCards.append(cards[index])
            
            if selectedCards.count == 3 {
                if doCardsMatch(selectedCards) {
                    let index1 = cards.firstIndex(of: selectedCards[0])
                    let index2 = cards.firstIndex(of: selectedCards[1])
                    let index3 = cards.firstIndex(of: selectedCards[2])
                    cards.remove(at: index1!)
                    cards.remove(at: index2!)
                    cards.remove(at: index3!)
                }
                selectedCards = []
            }
            
        }
    }
    
    func doCardsMatch (_ cardsToCheck: [Card]) -> Bool {
        let (first, second, third) = (cardsToCheck[0], cardsToCheck[1], cardsToCheck[2])
        let colorScore = first.color + second.color + third.color
        let countScore = first.count + second.count + third.count
        let shapeScore = first.shape + second.shape + third.shape
        let fillScore  = first.fill  + second.fill  + third.fill
        
        return colorScore % 3 == 0 && countScore % 3 == 0 && shapeScore % 3 == 0 && fillScore % 3  == 0
    }
    
    init() {
        for i in 1...3 {
            for j in 1...3 {
                for k in 1...3 {
                    for l in 1...3 {
                        cards.append(Card(color: i, shape: j, count: k, fill: l))
                    }
                }
            }
        }
    }
}
