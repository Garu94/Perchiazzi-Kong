//
//  Elevator.swift
//  Perchiazzi Kong
//
//  Created by Ernesto De Crecchio on 14/03/18.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class Elevator: SKSpriteNode {
  
  let upTexture = SKTexture.init(imageNamed: "elevator_0")
  let downTexture = SKTexture.init(imageNamed: "elevator_1")
  let stayTexture = SKTexture.init(imageNamed: "elevator_2")
  
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
  func setup(position: CGPoint) {
    self.position = position
  }
  
  func move(amountToMove: Int) {
    let moveDown = SKAction.moveTo(y: self.position.y - CGFloat(amountToMove), duration: 3)
    let moveUp = SKAction.moveTo(y: self.position.y, duration: 3)
    let wait = SKAction.wait(forDuration: 1)
    
    let moveAction = SKAction.sequence([SKAction.setTexture(downTexture), moveDown,SKAction.setTexture(stayTexture), wait, SKAction.setTexture(upTexture), moveUp, SKAction.setTexture(stayTexture), wait])
    run(SKAction.repeatForever(moveAction))
  }
  
}
