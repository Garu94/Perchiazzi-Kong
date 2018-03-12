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
    
    init() {
        
        super.init(texture: nil, color: .red, size: SpriteSize.player)
        
        self.name = "player"
    }
    
    func setup(view: SKView) {
        self.position = CGPoint(x: view.frame.midX, y: view.frame.maxY - 500)
        
        self.zPosition = Z.sprites
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
        self.physicsBody!.isDynamic = true
        self.physicsBody!.affectedByGravity = true
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
        
        if direction == .right {
            self.position.x += deltaMove
        } else {
            
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
