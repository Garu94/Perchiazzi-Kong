//
//  Barrel.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 09/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import Foundation

import SpriteKit

var falling = false

class Barrel: SKSpriteNode {
    
//    var collisionScoreCollider: SKSpriteNode?
    
    //MARK: init
    init() {
        //    super.init(texture: nil, color: .yellow, size: CGSize(width: 12, height: 12))
//        let texture = SKTexture(imageNamed: "spinning_barrels0")
        let texture = SKTexture(imageNamed: "barrel_spin")
        super.init(texture: texture, color: .clear, size: SpriteSize.barrel)
        name = "barrel"
        self.texture?.filteringMode = .nearest
        
//        collisionScoreCollider = SKSpriteNode(texture: nil, color: .clear, size: self.size)
        
        // Physics
        self.physicsBody = SKPhysicsBody(circleOfRadius: SpriteSize.barrelRadious)
        self.physicsBody?.mass = 4.0
        self.physicsBody?.angularDamping = 2
        self.physicsBody!.isDynamic = true
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.restitution = 0.2
        self.physicsBody!.categoryBitMask = PhysicsMask.barrel
        self.physicsBody!.contactTestBitMask = PhysicsMask.platform | PhysicsMask.ladder | PhysicsMask.player
//        self.physicsBody?.collisionBitMask = PhysicsMask.player | PhysicsMask.platform
        
//        //Increase Point Collider
//        collisionScoreCollider?.name = "increaseScore"
//        collisionScoreCollider?.zPosition = Z.sprites
//        collisionScoreCollider?.position = CGPoint(x: self.position.x, y: (self.position.y + SpriteSize.barrel.height))
//        collisionScoreCollider?.physicsBody = SKPhysicsBody(circleOfRadius: SpriteSize.barrelRadious)
//        collisionScoreCollider?.physicsBody?.affectedByGravity = true
//        collisionScoreCollider?.physicsBody?.isDynamic = true
//        collisionScoreCollider?.physicsBody?.categoryBitMask = PhysicsMask.increaseScore
//        collisionScoreCollider?.physicsBody?.contactTestBitMask = PhysicsMask.player
        
       
    
//        self.addChild(collisionScoreCollider!)
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
        
        //Fuori a destra
        if position.x - SpriteSize.barrelRadious <= leftSide {
            self.physicsBody?.velocity = CGVector(dx: +55.0, dy: 0)
        }
        
        //Fuori a sinistra
        if position.x + SpriteSize.barrelRadious >= rightSide {
            self.physicsBody?.velocity = CGVector(dx: -55.0, dy: 0)
        }
    }
    
    func fall() {
        debugPrint("Chiamata Fall")
        let fallOrNot = Int(arc4random_uniform(2))
        
        if fallOrNot == 1 {
            debugPrint("Deve Cadere")
            if(falling) {
                debugPrint("Sta già cadendo!")
            } else {
                debugPrint("Inizia a cadere!")
                falling = true
                
                let fall = SKAction.move(to: CGPoint(x: self.position.x, y: self.position.y -  SpriteSize.ladder.height), duration: 2)
                self.run(fall)
                //        position.y = position.y - 20
                
                falling = false
            }
        } else {
            debugPrint("NON deve cadere")
        }
    }
    
}
