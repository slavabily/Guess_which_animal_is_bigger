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
    
    var showMainViewAction: ((ProjectDataSource) -> Void)?
    var dataSource = ProjectDataSource()
    
    override func loadView() {
        dataSource.prepareQuestion()
        dataSource.prepareAnswer()
        showMainViewAction?(dataSource)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.largeTitleDisplayMode = .never
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Score", style: .plain, target: self, action: #selector(showScoreTapped))
        
        title = "Which animal is bigger?"
     }
    
    @objc func shareTapped() {
        let ad = "Nice APP!"
        
        let vc = UIActivityViewController(activityItems: [ad], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
    
    @objc func showScoreTapped() {
        let score = "Score: " + dataSource.score.description + " - the croc is bigger than dolph :)"
        
        let vc = UIActivityViewController(activityItems: [score], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.leftBarButtonItem
        present(vc, animated: true)
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
        dataSource.prepareQuestion()
        dataSource.prepareAnswer()
        showMainViewAction?(dataSource)
    }
}

