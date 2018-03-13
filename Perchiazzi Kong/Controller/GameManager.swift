//
//  GameManager.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 09/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

//ENVIROMENT

import SpriteKit

class GameManager {
    static let shared = GameManager() // Singleton
    
    // Stats & HUD
    var score: Int = 0
    var appCounted: Bool = false
    var monstersKills: Int = 0
    var timerCounter: Int = 30
    
    // Textures
    var allTextures: [SKTexture] = []


}

//Singleton per cose comuni nel gioco. Es.: score, timer per bonus, bonus iniziale del livello....

//HUD-branch
