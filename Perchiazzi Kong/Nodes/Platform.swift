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
    super.init(texture: nil, color: color, size: size)
    
    // Physics
    self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
    self.physicsBody?.mass = 4.0
    self.physicsBody!.isDynamic = false
    self.physicsBody!.affectedByGravity = false
    self.physicsBody!.restitution = 0.4
    
    self.physicsBody!.categoryBitMask = PhysicsMask.platform
    self.physicsBody!.contactTestBitMask = PhysicsMask.barrel
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: setup
  func setup(rotation: Float, xPosition: Float, leftHeight: Float) {
    let m = tanf(rotation)
    let yPosition = (m*xPosition)+leftHeight
    self.position.x = CGFloat(xPosition)
    self.position.y = CGFloat(yPosition)
    self.zRotation = CGFloat(rotation+(.pi/2))
  }
  
  func simpleSetup(rotation: CGFloat, position: CGPoint) {
    self.zRotation = rotation
    self.position = position
  }
}
