//
//  Player5MovesState.swift
//  XO-game
//
//  Created by Anna Luchechko on 26.11.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class Player5MovesState: GameState {
    var isMoveCompleted: Bool = false
    private var moveCounter: Int = 0
    
    public let player: Player
    private weak var gameViewController: GameViewController?
    private weak var gameBoard: Gameboard?
    private weak var gameBoardView: GameboardView?
    
    public let markViewPrototype: MarkView
    
    init(player: Player, gameViewController: GameViewController,
         gameBoard: Gameboard, gameBoardView: GameboardView, markViewPrototype: MarkView) {
        self.player = player
        self.gameViewController = gameViewController
        self.gameBoard = gameBoard
        self.gameBoardView = gameBoardView
        self.markViewPrototype = markViewPrototype
    }
    
    func begin() {
        switch player {
        case .first:
            gameViewController?.firstPlayerTurnLabel.isHidden = false
            gameViewController?.secondPlayerTurnLabel.isHidden = true
        case .second:
            gameViewController?.firstPlayerTurnLabel.isHidden = true
            gameViewController?.secondPlayerTurnLabel.isHidden = false
        }
        
        gameViewController?.winnerLabel.isHidden = true
    }
    
    func addMark(at position: GameboardPosition) {
        Log(action: .playerSetMark(player: player, position: position))
        
        guard let gameBoard = gameBoard, let gameBoardView = gameBoardView, gameBoardView.canPlaceMarkView(at: position) else {
            return
        }

        gameBoard.setPlayer(player, at: position)
        gameBoardView.placeMarkView(markViewPrototype.copy(), at: position)
        
        PlayerInvoker.shared.addPlayerCommand(command: PlayerCommand(player: player, gameBoardPosition: position, gameBoardView: gameBoardView, gameBoard: gameBoard))
        
        moveCounter += 1
        
        if(moveCounter >= 5) {
            isMoveCompleted = true
        }
        
    }
}
