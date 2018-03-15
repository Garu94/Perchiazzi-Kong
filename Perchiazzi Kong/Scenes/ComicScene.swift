//
//  ComicScene.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 15/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class ComicScene: SKScene {
    
    var animationArray: [SKTexture] = []
    var animatioNode: SKSpriteNode?
    let labelText = "Tap To Skip"
    
    override func didMove(to view: SKView) {
        
        let labelNode = SKLabelNode(text: labelText)
        labelNode.fontName = "Pixeled"
        labelNode.fontSize = 20
        labelNode.color = .white
        labelNode.zPosition = Z.HUD
        labelNode.position = CGPoint(x: view.frame.maxX - (labelNode.frame.width/2), y: view.frame.minY + (labelNode.frame.height/2))
        self.addChild(labelNode)
        
        
        self.animationArray = GameManager.shared.allTextures.filter { $0.description.contains("comic") }
        let scene = GameScene(size: size)
        let animationNode = SKSpriteNode(texture: animationArray[0], color: .clear, size: view.frame.size)
        let animation = SKAction.animate(with: animationArray, timePerFrame: (2.0))
        let presentScene = SKAction.run {
            self.scene?.scaleMode = self.scaleMode
            let transitionType = SKTransition.flipVertical(withDuration: 0.5)
            view.presentScene(scene, transition: transitionType)
        }
        let sequence = SKAction.sequence([animation, presentScene])
        animationNode.run(sequence)
        animationNode.position = view.center
        self.addChild(animationNode)
    }
    
    override func update(_ currentTime: TimeInterval) {
        
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let scene = GameScene(size: size)
        scene.scaleMode = scaleMode
        let transitionType = SKTransition.flipVertical(withDuration: 0.5)
        view?.presentScene(scene, transition: transitionType)
    }
    
}
