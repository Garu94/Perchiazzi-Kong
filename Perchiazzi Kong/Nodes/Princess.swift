//
//  Princess.swift
//  Perchiazzi Kong
//
//  Created by Ernesto De Crecchio on 15/03/18.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class Princess: SKSpriteNode {
  
  //Preload Sounds
  
  let kissSound = SKAction.playSoundFileNamed("kissSound.wav", waitForCompletion: false)
  //Textures
  var textures: [String: [SKTexture]] = [:]
  
  init() {
    // Extract sprites from Singleton
    self.textures["idle"] = GameManager.shared.allTextures.filter { $0.description.contains("stefy_idle") }
    self.textures["win"] = GameManager.shared.allTextures.filter { $0.description.contains("stefy_win") }
    
    // Instantiate Princess
    super.init(texture: textures["idle"]?[0], color: .clear, size: SpriteSize.princess)
    self.name = "princess"
  }
  
  func setup(view: SKView) {
    self.zPosition = Z.sprites
    
    let startingX = view.frame.width - (SpriteSize.princess.width)
    let startingY = view.frame.height - self.frame.height - spacing
    self.position = CGPoint(x: startingX, y: startingY)
    
    //Flip the sprite
    self.xScale = -1
    
    // Start Idle Animation
    self.animate(type: "idle")
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func reachedByPlayer() {
    run(kissSound)
    self.animate(type: "win")
    debugPrint("Princess Reached")
  }
  
  func animate(type: String) {
    guard let texturesOfType = textures[type] else {
      return
    }
    let animation = SKAction.animate(with: texturesOfType, timePerFrame: (2.0 / 5.0))
    self.run(SKAction.repeatForever(animation))
  }
  
}

