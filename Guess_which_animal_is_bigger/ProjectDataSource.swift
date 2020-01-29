//
//  ProjectDataSource.swift
//  Guess_which_animal_is_bigger
//
//  Created by slava bily on 26/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import Foundation
import GameplayKit

struct ProjectDataSource {
    
   private var animals = [String]()
    
    var count: Int {
        return animals.count
    }
    
    var correctAnswer = 0
    var score = 0
    
    var button1Name: String!
    var button2Name: String!
    var button3Name: String!
    
    mutating func prepareQuestion() {
        
        animals = ["elephant", "dolphin", "bear", "crocodile", "deer", "wolf"]
        
        animals = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: animals) as! [String]
        
        button1Name = animals[0]
        button2Name = animals[1]
        button3Name = animals[2]
    }
    
    mutating func prepareAnswer() {
        let buttonsNames = [button1Name, button2Name, button3Name]
        var animalsSizes = [Int]()
        
        for buttonName in buttonsNames {
            switch buttonName {
            case "elephant":
                animalsSizes.append(6)
            case "crocodile":
                animalsSizes.append(5)
            case "deer":
                animalsSizes.append(3)
            case "wolf":
                animalsSizes.append(1)
            case "dolphin":
                animalsSizes.append(4)
            case "bear":
                animalsSizes.append(2)
            default:
                break
            }
        }
        
        if let maxSizeAnimal = animalsSizes.max() {
            if let index = animalsSizes.firstIndex(of: maxSizeAnimal) {
                correctAnswer = index
            } else {
                fatalError("Size of max animal could no be found.")
            }
            print("Max size animal number:\(maxSizeAnimal) \n", "correctAnswer:\(correctAnswer)")
            
        } else {
            fatalError("Max size animal could not be found.")
        }
    }
}
