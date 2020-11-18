//
//  GameOverState.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 11/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class GameOverState: GameState {
    var isMoveCompleted = false
    
    public let winner: Player?
    
    private weak var gameViewController: GameViewController?
    
    init(winner: Player?, gameViewController: GameViewController) {
        self.winner = winner
        self.gameViewController = gameViewController
    }
    
    func begin() {
        Log(action: .gameFinisehd(winner: winner))
        
        gameViewController?.winnerLabel.isHidden = false
        
        if let winner = winner {
            gameViewController?.winnerLabel.text = getWinnerName(from: winner) + " won"
        } else {
            gameViewController?.winnerLabel.text = "No winner"
        }
        
        gameViewController?.firstPlayerTurnLabel.isHidden = true
        gameViewController?.secondPlayerTurnLabel.isHidden = true
    }
    
    func addMark(at position: GameboardPosition) { }
    
    
    func getWinnerName(from: Player) -> String {
        switch winner {
        case .first:
            return "1st player"
        case .second:
            return "2nd player"
        case .none:
            return "there is no winner"
        }
    }
    
}
