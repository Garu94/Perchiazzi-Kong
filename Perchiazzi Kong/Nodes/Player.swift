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
    var velocity: CGFloat = 25
    var isJumping = false
    
    
    init() {
        // Extract sprites from Singleton
        self.textures["idle"] = GameManager.shared.allTextures.filter { $0.description.contains("dario_idle") }
        self.textures["jump"] = GameManager.shared.allTextures.filter { $0.description.contains("dario_jump") }
        self.textures["run"] = GameManager.shared.allTextures.filter { $0.description.contains("dario_run") }
        self.textures["ladder"] = GameManager.shared.allTextures.filter { $0.description.contains("dario_ladder") }
        self.textures["win"] = GameManager.shared.allTextures.filter { $0.description.contains("dario_win") }
        //TODO: Remember to rotate the texture in die()
        self.textures["lose"] = GameManager.shared.allTextures.filter { $0.description.contains("dario_lose") }
        
        
        
        
        debugPrint(textures)
        
        super.init(texture: textures["idle"]?[0], color: .red, size: SpriteSize.player)
        
        self.name = "player"
        self.setScale(4.0)
    }
    
    func setup(view: SKView) {
        self.position = CGPoint(x: view.frame.midX, y: view.frame.maxY - 550)
        
        self.zPosition = Z.sprites
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
//        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: (self.texture?.size())!)
        self.physicsBody!.isDynamic = true
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.categoryBitMask = PhysicsMask.player
        self.physicsBody!.contactTestBitMask = PhysicsMask.barrel
//        self.physicsBody?.collisionBitMask = PhysicsMask.ladder | PhysicsMask.platform | PhysicsMask.barrel
        self.physicsBody?.restitution = 0.4
        
        // Start Idle Animation
        self.animate(type: "idle")
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
        let deltaY: CGFloat = (SpriteSize.barrelRadious * 2) + (self.size.height / 2)
        
        let startAction = SKAction.run {
            self.physicsBody?.affectedByGravity = false
        }
        let jumpUpAction = SKAction.moveBy(x: 0, y: deltaY, duration: 0.2)
        let jumpDownAction = SKAction.moveBy(x: 0, y: -deltaY, duration: 0.2)
        let stopJump = SKAction.run {
            self.physicsBody?.affectedByGravity = true
            self.isJumping = false
        }
        let jumpSequence = SKAction.sequence([startAction, jumpUpAction, jumpDownAction, stopJump])
        
        self.run(jumpSequence)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func walk() {
//        
//        let deltaMove = velocity * CGFloat(deltaTime)
//        switch direction {
//        case .right:
//            self.position.x += deltaMove
//        case .left:
//            self.position.x -= deltaMove
//        default:
//            break
//        }
        
    }
    
    func animate(type: String) {
        guard let texturesOfType = textures[type] else {
            return
        }
        let animation = SKAction.animate(with: texturesOfType, timePerFrame: (2.0 / 5.0))
        self.run(SKAction.repeatForever(animation))
    }
    
}
