//
//  ViewController.swift
//  Guess_which_animal_is_bigger
//
//  Created by slava bily on 23/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit
import GameplayKit

class ViewController: UIViewController, Storyboarded {
    
    weak var coordinator: MainCoordinator?
    
    var animals = [String]()
    var correctAnswer = 0
    var score = 0
    
    var button1Name: String!
    var button2Name: String!
    var button3Name: String!
    
    let button1 = UIButton()
    let button2 = UIButton()
    let button3 = UIButton()
    
    let scoreLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        animals.append("elephant")
        animals.append("dolphin")
        animals.append("bear")
        animals.append("crocodile")
        animals.append("deer")
        animals.append("wolf")
        
        navigationItem.largeTitleDisplayMode = .never
        
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -30)
        ])
 
        button1.layer.borderWidth = 1
        button2.layer.borderWidth = 1
        button3.layer.borderWidth = 1
        
        scoreLabel.textAlignment = .center
        scoreLabel.attributedText = NSAttributedString(string: "Score: 0", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)])
        
        button1.layer.borderColor = UIColor.lightGray.cgColor
        button2.layer.borderColor = UIColor.lightGray.cgColor
        button3.layer.borderColor = UIColor.lightGray.cgColor
        
        button1.translatesAutoresizingMaskIntoConstraints = false
        button2.translatesAutoresizingMaskIntoConstraints = false
        button3.translatesAutoresizingMaskIntoConstraints = false
        
        stackView.addArrangedSubview(button1)
        stackView.addArrangedSubview(button2)
        stackView.addArrangedSubview(button3)
        stackView.addArrangedSubview(scoreLabel)
        
        stackView.setCustomSpacing(30, after: button1)
        stackView.setCustomSpacing(30, after: button2)
        stackView.distribution = .fillEqually
        
        askQuestion()
     }
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        animals = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: animals) as! [String]
        
        button1Name = animals[0]
        button2Name = animals[1]
        button3Name = animals[2]
        
        button1.setImage(UIImage(named: button1Name), for: .normal)
        button2.setImage(UIImage(named: button2Name), for: .normal)
        button3.setImage(UIImage(named: button3Name), for: .normal)
        
        button1.tag = 0
        button2.tag = 1
        button3.tag = 2
        
        button1.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button2.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        button3.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchUpInside)
        
        title = "Which animal is bigger?"
        
        compare()
    }
    
    func compare() {
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
    
   @objc func buttonTapped(_ sender: UIButton) {
        
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct"
            score += 1
        } else {
            title = "Wrong"
            score -= 1
        }
        
        let ac = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion(action:)))
        present(ac, animated: true)
        
         scoreLabel.attributedText = NSAttributedString(string: "Score: \(score)", attributes: [NSAttributedString.Key.font: UIFont.preferredFont(forTextStyle: .largeTitle)])
    }
    
}

