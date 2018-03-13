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

    override func sceneDidLoad() {
        GameManager.shared.timer?.invalidate()
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        let gameoverLabel = SKLabelNode(fontNamed: HUDSettings.font)
        gameoverLabel.fontSize = 80
        gameoverLabel.text = "Game Over"
        gameoverLabel.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameoverLabel)
    }
    
    let wait = SKAction.wait(forDuration: 6.0)
    let block = SKAction.run {
//        let scene = MenuScene(size: self.size)
//        scene.scaleMode = .aspectFill
        let transitionType = SKTransition.flipHorizontal(withDuration: 0.5)
//        self.view?.presentScene(scene, transition: transitionType)
    }
//    self.run(SKAction.sequence([wait, block]))
    
}

