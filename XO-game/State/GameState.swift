//
//  GameState.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 11/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

protocol GameState {

    var isMoveCompleted: Bool { get }
    
    func begin()
    func addMark(at position: GameboardPosition)
    
}
