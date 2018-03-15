//
//  MenuScene.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 12/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit
import AVKit

class MenuScene: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = .black
        
//        let animationView = LauncView(frame: (self.view?.frame)!)
//        self.view?.addSubview(animationView)
        
//        playVideo()
        
        let buttonStart = SKSpriteNode(texture: nil, color: .red, size: SpriteSize.button)
        buttonStart.name = "buttonStart"
        buttonStart.position = CGPoint(x: size.width / 2, y: size.height / 2)
        buttonStart.size = SpriteSize.button
        buttonStart.zPosition = Z.HUD
        addChild(buttonStart)
        
    }
    
    func touchDown(atPoint pos: CGPoint) {
        //    debugPrint("menu down: \(pos)")
        let touchedNode = self.atPoint(pos)
        if touchedNode.name == "buttonStart" {
            let button = touchedNode as! SKSpriteNode
            button.color = .green
        }
    }
    
    func touchUp(atPoint pos: CGPoint) {
        //    debugPrint("menu up: \(pos)")
        
        let touchedNode = self.atPoint(pos)
        
        if let button = childNode(withName: "buttonStart") as? SKSpriteNode {
            button.color = .red
        }
        
        if touchedNode.name == "buttonStart" {
            let scene = ComicScene(size: size)
            scene.scaleMode = scaleMode
            let transitionType = SKTransition.flipVertical(withDuration: 0.5)
            view?.presentScene(scene, transition: transitionType)
        }
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        self.touchDown(atPoint: touch.location(in: self))
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        self.touchUp(atPoint: touch.location(in: self))
    }
    
    private func playVideo() {
        guard let path = Bundle.main.path(forResource: "launch", ofType:"mov") else {
            debugPrint("video.m4v not found")
            return
        }
        let animation = AVPlayer(url: URL(fileURLWithPath: path))
        
        animation.play()
    }
    
}
