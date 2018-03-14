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
    var orientation: CGFloat = 0.0
    var isOnLadder: Bool = false
    var isRunning = false
//    var floor: SKPhysicsBody?
//    var floorNode = SKNode()
    
    
    init() {
        // Extract sprites from Singleton
        self.textures["idle"] = GameManager.shared.allTextures.filter { $0.description.contains("dario-idle") }
        self.textures["jump"] = GameManager.shared.allTextures.filter { $0.description.contains("dario-jump") }
        self.textures["run"] = GameManager.shared.allTextures.filter { $0.description.contains("dario-run") }
        self.textures["ladder"] = GameManager.shared.allTextures.filter { $0.description.contains("dario-ladder") }
        self.textures["win"] = GameManager.shared.allTextures.filter { $0.description.contains("dario-win") }
        //TODO: Remember to rotate the texture in die()
        self.textures["lose"] = GameManager.shared.allTextures.filter { $0.description.contains("dario-lose") }
        
        
        
        
//        debugPrint(textures)
        
        super.init(texture: textures["idle"]?[0], color: .red, size: SpriteSize.player)
        
        self.name = "player"
        self.setScale(1.0)
    }
    
    func setup(view: SKView) {
        self.position = CGPoint(x: view.frame.midX, y: view.frame.maxY - 550)
        
        self.zPosition = Z.sprites
        self.physicsBody = SKPhysicsBody(rectangleOf: self.size)
//        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: (self.texture?.size())!)
        self.physicsBody!.isDynamic = true
        self.physicsBody?.allowsRotation = false
        self.physicsBody!.affectedByGravity = true
        self.physicsBody!.categoryBitMask = PhysicsMask.player
        self.physicsBody!.contactTestBitMask = PhysicsMask.barrel
//        self.physicsBody?.collisionBitMask = PhysicsMask.ladder | PhysicsMask.platform | PhysicsMask.barrel
        self.physicsBody?.restitution = 0.4
        
//        floor = SKPhysicsBody(edgeFrom: CGPoint(x: self.frame.minX, y: self.frame.minY), to: CGPoint(x: self.frame.maxX, y: self.frame.minY))
//        floorNode.physicsBody = floor
//        addChild(floorNode)
        
        
        // Start Idle Animation
        self.animate(type: "idle")
    }
    
    func move(deltaTime: TimeInterval, direction: Direction) {
//        debugPrint(textures["run"])
        
        
        let deltaMove = velocity * CGFloat(deltaTime)
    
        switch direction {
        case .right:
            orientation = 1.0
            self.xScale = fabs(self.xScale) * orientation
            self.position.x += deltaMove
        case .left:
            orientation = -1.0
            self.xScale = fabs(self.xScale) * orientation
            self.position.x -= deltaMove
//        case .up:
//            self.physicsBody?.affectedByGravity = false
//            self.position.y += deltaMove
//            self.floorNode.position.y += deltaMove
        default:
//            self.physicsBody?.affectedByGravity = true
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
            self.animate(type: "jump")
        }
        
        let jumpUpAction = SKAction.moveBy(x: 0, y: deltaY, duration: 0.2)
        let jumpDownAction = SKAction.moveBy(x: 0, y: -deltaY, duration: 0.2)
        let stopJump = SKAction.run {
            self.physicsBody?.affectedByGravity = true
            self.isJumping = false
            if self.isRunning {
                self.animate(type: "run")
            } else {
                self.animate(type: "idle")
            }
        }
        let jumpSequence = SKAction.sequence([startAction, jumpUpAction, jumpDownAction, stopJump])
        
        self.run(jumpSequence)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func checkBorderCollision(playableZone: CGRect) {
        let leftSide = playableZone.minX
        let rightSide = playableZone.maxX
        
        //Fuori a destra
        if position.x - SpriteSize.player.width/2 <= leftSide {
            self.position.x = leftSide + SpriteSize.player.width/2
        }
        
        //Fuori a sinistra
        if position.x + SpriteSize.player.width/2 >= rightSide {
            self.position.x = rightSide - SpriteSize.player.width/2
        }
    }
    
    func die() {
        self.removeAllActions()
        
        let dyingAnimation = SKAction.run {
            self.animate(type: "lose")
        }
        
        let rotation = SKAction.rotate(byAngle: .pi/2, duration: 0.2)
        let continueRotation = SKAction.repeatForever(rotation)
        
         self.run(SKAction.sequence([dyingAnimation, continueRotation]))
        
    }
    
    
    func animate(type: String) {
        
//        if type == "idle" {
//            self.texture = SKTexture(imageNamed: "dario00")
//            return
//        }
        
        guard let texturesOfType = textures[type] else {
            return
        }
        debugPrint(texturesOfType)
        let animation = SKAction.animate(with: texturesOfType, timePerFrame: (1.0 / 5.0))
        self.run(SKAction.repeatForever(animation))
    }
    
}
