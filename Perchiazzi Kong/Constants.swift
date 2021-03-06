//
//  Constants.swift
//  Perchiazzi Kong
//
//  Created by Ernesto De Crecchio on 11/03/18.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

let spacing: CGFloat = 10

enum PhysicsMask {
    static let player: UInt32 = 0x1 << 1    // 2
    static let platform: UInt32 = 0x1 << 2    // 4
    static let barrel: UInt32 = 0x1 << 3     // 8
    static let elevator: UInt32 = 0x1 << 4  // 16
    static let increaseScore: UInt32 = 0x1 << 5 //32
}

enum Z {
    static let background: CGFloat = -1.0 // in this way the background will be always in background beacause is set to "-1"
    static let sprites: CGFloat = 10.0
    static let HUD: CGFloat = 100.0
}

enum SpriteSize {
    static let platform = CGSize(width: 10, height: 350)
    static let barrel = CGSize(width: 20, height: 20)
    static let ladder = CGSize(width: 15, height: 50)
    static let player = CGSize(width: 36, height: 47)
    static let button = CGSize(width: 60, height: 60)
    static let enemy = CGSize(width: 94, height: 68)
    static let princess = CGSize(width: 51, height: 43)
    static let elevator = CGSize(width: 30, height: 12)
    static let barrelRadious: CGFloat = 10.0
}

enum Direction {
    case up
    case right
    case down
    case left
    case stop
}
