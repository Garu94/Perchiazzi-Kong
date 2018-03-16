//
//  EndScene.swift
//  Perchiazzi Kong
//
//  Created by Francesca Palese on 13/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import UIKit
import SpriteKit

class EndScene: SKScene {
    let won: Bool
    override func sceneDidLoad() {
        GameManager.shared.timer?.invalidate()
    }
    
    init(size: CGSize, won: Bool) {
        self.won = won
        super.init(size: size)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
        if won {
            let skTexture = SKTexture(imageNamed: "win_scene")
            let winSprite = SKSpriteNode(texture: skTexture, color: .clear, size: size)
            winSprite.position = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
            addChild(winSprite)
            
        } else {
            
            let skTexture = SKTexture(imageNamed: "end_scene1")
            let loseSprite = SKSpriteNode(texture: skTexture, color: .clear, size: size)
            loseSprite.position = CGPoint(x: view.frame.width/2, y: view.frame.height/2)
            addChild(loseSprite)
        }
        
        let wait = SKAction.wait(forDuration: 6.0)
        let block = SKAction.run {
            let scene = ComicScene(size: self.frame.size)
            scene.scaleMode = .aspectFill
            let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
            self.view?.presentScene(scene, transition: transitionType)
        }
        self.run(SKAction.sequence([wait, block]))
    }
}

