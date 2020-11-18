//
//  LogCommand.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 11/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class LogCommand {
    
    let action: LogAction
    
    init(action: LogAction) {
        self.action = action
    }
    
    var logMessage: String {
        switch action {
        case .playerSetMark(let player, let position):
            return "\(player) placed mark at \(position)"
        case .gameFinisehd(let winner):
            if let winner = winner {
                return "\(winner) won game"
            } else {
                return "Is draw"
            }
        case .restartGame:
            return "Game restarted"
        }
    }
    
}
