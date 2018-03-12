//
//  Barrel.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 09/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

let radious:CGFloat = 15.0
var falling = false

class Barrel: SKSpriteNode {  
  //MARK: init
  override init(texture: SKTexture?, color: UIColor, size: CGSize) {
    super.init(texture: nil, color: color, size: SpriteSize.barrel)
    name = "barrel"
    
    // Physics
    self.physicsBody = SKPhysicsBody(circleOfRadius: radious)
    self.physicsBody?.mass = 4.0
    self.physicsBody!.isDynamic = true
    self.physicsBody!.affectedByGravity = true
    self.physicsBody!.restitution = 0.5
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  //MARK: setup
  func setup(position: CGPoint) {
    self.position = position
  }
  
  func checkPosition(playableZone: CGRect) {
    let leftSide = playableZone.minX
    let rightSide = playableZone.maxX
    
    if position.x - radious <= leftSide {
      print("fuori a destra")
      self.physicsBody?.velocity = CGVector(dx: +15.0, dy: 0)
    }
    
    if position.x + radious >= rightSide {
      print("fuori a sinistra")
      self.physicsBody?.velocity = CGVector(dx: -15.0, dy: 0)
    }
  }
  
}

