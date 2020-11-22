//
//  ComputerState.swift
//  XO-game
//
//  Created by Anna Luchechko on 19.11.2020.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

class ComputerState: GameState {
    var isMoveCompleted: Bool = false
    
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
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) { // Change `2.0` to the desired number of seconds.
            self.placeCumputerMark()
        }
    }
    
    func addMark(at position: GameboardPosition) {
        Log(action: .playerSetMark(player: player, position: position))
        
        guard let gameBoardView = gameBoardView, gameBoardView.canPlaceMarkView(at: position) else {
            return
        }

        gameBoard?.setPlayer(player, at: position)
        gameBoardView.placeMarkView(markViewPrototype.copy(), at: position)
        
        isMoveCompleted = true
    }
    
    func generateRandomPosition() -> GameboardPosition {
        let randomRow = Int.random(in: 0...2)
        let randomColumn = Int.random(in: 0...2)
        
        return GameboardPosition(column: randomColumn, row: randomRow)
    }
    
    func placeCumputerMark() {
        var canPlace = false
        var randomPosition: GameboardPosition = generateRandomPosition()
        
        guard let gameBoardView = gameBoardView else { return }
        
        while !canPlace {
            randomPosition = generateRandomPosition()
            canPlace = gameBoardView.canPlaceMarkView(at: randomPosition)
        }
        gameBoardView.onSelectPosition?(randomPosition)
    }
    
}
