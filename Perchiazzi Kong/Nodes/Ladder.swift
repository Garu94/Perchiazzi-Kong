//
//  Ladder.swift
//  Perchiazzi Kong
//
//  Created by Ernesto De Crecchio on 11/03/18.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class Ladder: SKSpriteNode {

  //MARK: init
  override init(texture: SKTexture?, color: UIColor, size: CGSize) {
    super.init(texture: nil, color: color, size: SpriteSize.ladder)
    name = "ladder"
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: setup
  func setup(position: CGPoint) {
    self.position = position
  }
}
