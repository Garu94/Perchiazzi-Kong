//
//  Player.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 12/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class Player: SKSpriteNode {
    
    var textures: [String: [SKTexture]] = [:]
    var velocity: CGFloat = 100
    var isJumping = false
    
    
    init() {
        
        super.init(texture: nil, color: .red, size: SpriteSize.player)
        
        self.name = "player"
    }
    
    func setup(view: SKView) {
        self.position = CGPoint(x: view.frame.midX, y: view.frame.maxY - 550)
        
        self.zPosition = Z.sprites
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody!.isDynamic = true
        self.physicsBody!.affectedByGravity = false
        self.physicsBody!.categoryBitMask = PhysicsMask.player
        self.physicsBody!.contactTestBitMask = PhysicsMask.barrel
        self.physicsBody?.collisionBitMask = PhysicsMask.ladder | PhysicsMask.platform
        self.physicsBody?.restitution = 0.4
    }
    
    func move(deltaTime: TimeInterval, direction: Direction) {
        let deltaMove = velocity * CGFloat(deltaTime)
        switch direction {
        case .right:
            self.position.x += deltaMove
        case .left:
            self.position.x -= deltaMove
        default:
            break
        }
        
    }
    
    func jump() {
        if isJumping {
            return
        }
        isJumping = true
        let deltaY: CGFloat = 20
        
        let jumpUpAction = SKAction.moveBy(x: 0, y: deltaY, duration: 0.2)
        let jumpDownAction = SKAction.moveBy(x: 0, y: -deltaY, duration: 0.2)
        let stopJump = SKAction.run {
            self.isJumping = false
        }
        let jumpSequence = SKAction.sequence([jumpUpAction, jumpDownAction, stopJump])
        
        self.run(jumpSequence)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
