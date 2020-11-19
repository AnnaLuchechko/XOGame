//
//  StartViewController.swift
//  XO-game
//
//  Created by Anna Luchechko on 19.11.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import UIKit

enum GameType {
    case vsComputer, vsPlayer
}

class StartViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func gameType(_ sender: UIButton) {
        guard let mainStoryboard = storyboard else { fatalError() }
        guard let gameViewController = mainStoryboard.instantiateViewController(withIdentifier: "gameViewController") as? GameViewController else { fatalError() }
        
        switch sender.tag {
        case 0:
            gameViewController.gameType = .vsPlayer
        case 1:
            gameViewController.gameType = .vsComputer
        default:
            gameViewController.gameType = .vsPlayer
        }
        
        show(gameViewController, sender: nil)
    }
    
}
