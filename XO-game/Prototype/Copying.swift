//
//  Copying.swift
//  XO-game
//
//  Created by Veaceslav Chirita on 11/6/20.
//  Copyright © 2020 plasmon. All rights reserved.
//

import Foundation

protocol Copying: AnyObject {
    init(_ prototype: Self)
}

extension Copying where Self: AnyObject {
    func copy() -> Self {
        return type(of: self).init(self)
    }
}
