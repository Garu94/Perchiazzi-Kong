//
//  GameManager.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 09/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

//ENVIROMENT

import Foundation
import SpriteKit
//Singleton per cose comuni nel gioco. Es.: score, timer per bonus, bonus iniziale del livello....

//HUD-branch

enum Scores {
    static let bonus = 10
}

class GameManager {
    
    static let shared = GameManager()
    
    let bonusString: String = "BONUS: "
    var score: Int = 0
    var bonus: Int = 4444
    var timerCounter: Int = 0
    var life: Int = 3
    
    //textures
    var allTextures: [SKTexture] = []
    
    var timer: Timer? {
        willSet {
            timer?.invalidate()
            timerCounter = 0
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
    }
    
    func startTimer(label: SKLabelNode) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { t in
            self.timerCounter += 1
            if self.timerCounter % 2 == 0 {
                self.bonus -= 100
                label.text = self.bonusString + "\(self.bonus)"
                }
        })
    }
}

