//
//  Boss.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 12/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class Boss: SKSpriteNode {
    
    //Textures
    var textures: [String: [SKTexture]] = [:]
    
    init() {
        // Extract sprites from Singleton
        self.textures["idle"] = GameManager.shared.allTextures.filter { $0.description.contains("idle") }
        self.textures["action"] = GameManager.shared.allTextures.filter { $0.description.contains("action") }
        self.textures["angry"] = GameManager.shared.allTextures.filter { $0.description.contains("angry") }
        
        // Instantiate Player
        super.init(texture: textures["idle"]?[0], color: .clear, size: SpriteSize.enemy)
        self.name = "enemy"
    }
    
    func setup(view: SKView) {
        self.zPosition = Z.sprites
        
        let startingX = (spacing + SpriteSize.barrel.width) * 2.0
        let startingY = view.frame.height - self.frame.height - spacing
        self.position = CGPoint(x: startingX, y: startingY)
        
        // Start Idle Animation
        self.animate(type: "angry")
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func animate(type: String) {
        guard let texturesOfType = textures[type] else {
            return
        }
        let animation = SKAction.animate(with: texturesOfType, timePerFrame: (2.0 / 5.0))
        self.run(SKAction.repeatForever(animation))
    }
    
}
