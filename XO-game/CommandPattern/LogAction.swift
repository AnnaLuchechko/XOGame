//
//  LogAction.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 11/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

public enum LogAction {
    case playerSetMark(player: Player, position: GameboardPosition)
    case gameFinisehd(winner: Player?)
    case restartGame
}
