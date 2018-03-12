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
        // Extract frames from Singleton
        self.textures["idle"] = GameManager.shared.allTextures.filter { $0.description.contains("idle") }
        debugPrint(textures["idle"])
        self.textures["action"] = GameManager.shared.allTextures.filter { $0.description.contains("action") }
        self.textures["angry"] = GameManager.shared.allTextures.filter { $0.description.contains("angry") }
        self.textures["action"] = GameManager.shared.allTextures.filter { $0.description.contains("action") }
        
        // Instantiate Player
        super.init(texture: nil, color: .clear, size: SpriteSize.enemy)
        self.name = "enemy"
    }
    
    func setup(view: SKView) {
        self.zPosition = Z.sprites
        
        let startingX = (spacing + SpriteSize.barrel.width) * 2.0
        let startingY = view.frame.height - self.frame.height - spacing
        self.position = CGPoint(x: startingX, y: startingY)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
