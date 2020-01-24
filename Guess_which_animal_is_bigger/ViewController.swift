//
//  ViewController.swift
//  Guess_which_animal_is_bigger
//
//  Created by slava bily on 23/1/20.
//  Copyright © 2020 slava bily. All rights reserved.
//

import UIKit
import GameplayKit

enum Animals: Int {
    case elephant = 6
    case dolphin = 4
    case bear = 5
    case crocodile = 3
    case deer = 2
    case wolf = 1
    
    
}

class ViewController: UIViewController {
    
    var animals = [String]()
    var correctAnswer = 0
    var score = 0
    
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
        
        button1.setImage(UIImage(named: animals[0]), for: .normal)
        button2.setImage(UIImage(named: animals[1]), for: .normal)
        button3.setImage(UIImage(named: animals[2]), for: .normal)
        
        let elephant = String(describing: Animals.elephant)
        
        if elephant == "elephant" {
            print("YYYYYYY")
        }

 
        title = "Which animal is bigger?"
        
    }


}

