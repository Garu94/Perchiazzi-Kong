//
//  Platform.swift
//  Perchiazzi Kong
//
//  Created by Ernesto De Crecchio on 11/03/18.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class Platform: SKSpriteNode {
  
  //MARK: init
  override init(texture: SKTexture?, color: UIColor, size: CGSize) {
    super.init(texture: nil, color: color, size: SpriteSize.platform)
    
    // Physics
    self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
    self.physicsBody?.mass = 4.0
    self.physicsBody!.isDynamic = false
    self.physicsBody!.affectedByGravity = false
    self.physicsBody!.restitution = 0.4
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: setup
  func setup(position: CGPoint, rotation: CGFloat) {
    self.position = position
    self.zRotation = rotation
  }
}
