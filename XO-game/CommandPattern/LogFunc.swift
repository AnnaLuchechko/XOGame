//
//  LogFunc.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 11/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

public func Log(action: LogAction) {
    let command = LogCommand(action: action)
    LogInvoker.shared.addLogCommand(command: command)
}
