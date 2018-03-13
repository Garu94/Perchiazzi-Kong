//
//  Constants.swift
//  Perchiazzi Kong
//
//  Created by Ernesto De Crecchio on 11/03/18.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

enum PhysicsMask {
  static let player: UInt32 = 0x1 << 1    // 2
  static let platform: UInt32 = 0x1 << 2    // 4
  static let barrel: UInt32 = 0x1 << 3     // 8
  static let ladder: UInt32 = 0x1 << 4  // 16
}

enum SpriteSize {
  static let platform = CGSize(width: 10, height: 50)
  static let barrel = CGSize(width: 35, height: 35)
  static let barrelRadious = CGFloat(12)
  static let ladder = CGSize(width: 15, height: 70)
}
