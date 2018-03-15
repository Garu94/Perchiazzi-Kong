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
  
  func moveVertically(amountToMove: Float, time: Float) {
    let moveUp = SKAction.moveTo(y: self.position.y + CGFloat(amountToMove) + self.size.height/2, duration: TimeInterval(time))
    let moveDown = SKAction.moveTo(y: self.position.y, duration: TimeInterval(time))
    let wait = SKAction.wait(forDuration: 1)
    
    let moveAction = SKAction.sequence([moveUp, wait, moveDown, wait])
    run(SKAction.repeatForever(moveAction))
  }
  
  func moveHorizontallyRightLeft(amountToMove: Float, time: Float) {
    let moveRight = SKAction.moveTo(x: self.position.x + CGFloat(amountToMove) + self.size.width/2, duration: TimeInterval(time))
    let moveLeft = SKAction.moveTo(x: self.position.x, duration: TimeInterval(time))
    let wait = SKAction.wait(forDuration: 1)
    
    let moveAction = SKAction.sequence([moveRight, wait, moveLeft, wait])
    run(SKAction.repeatForever(moveAction))
  }
  
  func moveHorizontallyLeftRight(amountToMove: Float, time: Float) {
    let moveLeft = SKAction.moveTo(x: self.position.x + CGFloat(amountToMove) + self.size.width/2, duration: TimeInterval(time))
    let moveRight = SKAction.moveTo(x: self.position.x, duration: TimeInterval(time))
    let wait = SKAction.wait(forDuration: 1)
    
    let moveAction = SKAction.sequence([moveLeft, wait, moveRight, wait])
    run(SKAction.repeatForever(moveAction))
  }
  
}
