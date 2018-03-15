//
//  GameViewController.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 08/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create view
        if let view = self.view as! SKView? {
            
            
            
            // Debug
            view.ignoresSiblingOrder = false
            view.showsFPS = true
            view.showsNodeCount = true
//            view.showsPhysics = true
          
            //Load textures atlas
            let playerAtlas = SKTextureAtlas(named: "Sprites")
            debugPrint(playerAtlas)
            
            // Get the list of texture names, and sort them
            let textureNames = playerAtlas.textureNames.sorted { (first, second) -> Bool in
                return first < second
            }

            // Load all textures into Singleton
            GameManager.shared.allTextures = textureNames.map {
                return playerAtlas.textureNamed($0)
            }

//            debugPrint(GameManager.shared.allTextures)
          
            // Create Scene
            let scene = ComicScene(size: view.frame.size)
            scene.scaleMode = .aspectFill // Fit the window
            
            // Show Screen
            view.presentScene(scene)
        }
    }
    
    override var shouldAutorotate: Bool {
        return true
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}
