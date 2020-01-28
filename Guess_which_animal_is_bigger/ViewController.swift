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
    
    let dataSource = ProjectDataSource()
    
    override func loadView() {
        view = MainView(dataSource: dataSource, buttonAction: { [unowned self] (b) in
            self.buttonAction(b)
        })
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        title = "Which animal is bigger?"
        
     }
    
    func buttonAction(_ sender: UIButton) {
        
        var title: String
               
               if sender.tag == dataSource.correctAnswer {
                   title = "Correct"
                   dataSource.score += 1
               } else {
                   title = "Wrong"
                   dataSource.score -= 1
               }
        
        let ac = UIAlertController(title: title, message: "Your score is \(dataSource.score)", preferredStyle: .alert)
                      ac.addAction(UIAlertAction(title: "Continue", style: .default, handler: reloadMainView(action:)))
                             present(ac, animated: true)
        
    }
    
    func reloadMainView(action: UIAlertAction) {
        view = MainView(dataSource: dataSource, buttonAction: { (b) in
            self.buttonAction(b)
        })
    }
}

