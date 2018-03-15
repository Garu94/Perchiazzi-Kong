//
//  HUD.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 12/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

enum HUDSettings {
    static let font = "Pixeled"
    static let fontSize: CGFloat = 9
}

class HUD: SKNode {

    
    let jumpButton = SKSpriteNode(texture: nil, color: .red, size: SpriteSize.button)
//    let rightArrow = SKSpriteNode(texture: nil, color: .red, size: SpriteSize.button)
    var pointLabel = SKLabelNode(fontNamed: HUDSettings.font)//saltare barile e non morire
    var topLabel = SKLabelNode(fontNamed: HUDSettings.font)
    var lifeLabel = SKLabelNode(fontNamed: HUDSettings.font) //3-> barrel
    var bonusLabel = SKLabelNode(fontNamed: HUDSettings.font) //5000
    var levelLabel = SKLabelNode(fontNamed: HUDSettings.font) //1
    let bonusFixedLabel = SKLabelNode(fontNamed: HUDSettings.font)
    let lifeFixedLabel = SKLabelNode(fontNamed: HUDSettings.font)
    let nameFixedLabel = SKLabelNode(fontNamed: HUDSettings.font)
    
    override init() {
        super.init()
        self.name = "HUD"
        
        pointLabel.text = "SCORE: " + String(GameManager.shared.score)
        pointLabel.zPosition = 100
        pointLabel.fontSize = HUDSettings.fontSize
        
        topLabel.text = "TOP: 000000"
        topLabel.zPosition = 100
        topLabel.fontSize = HUDSettings.fontSize
        
        bonusFixedLabel.text = "BONUS"
        bonusFixedLabel.zPosition = 100
        bonusFixedLabel.fontSize = HUDSettings.fontSize
        
//        lifeFixedLabel.text = "L"
//        lifeFixedLabel.zPosition = 100
//        lifeFixedLabel.fontSize = HUDSettings.fontSize
        
        nameFixedLabel.text = "D"
        nameFixedLabel.zPosition = 100
        nameFixedLabel.fontSize = HUDSettings.fontSize
        
        lifeLabel.text = "LIVES: " + String(GameManager.shared.life)
        lifeLabel.zPosition = 100
        lifeLabel.fontSize = HUDSettings.fontSize
        
        bonusLabel.text = "BONUS: " + String(GameManager.shared.bonus)
        bonusLabel.zPosition = 100
        bonusLabel.fontSize = HUDSettings.fontSize
        
        levelLabel.text = "LEVEL: 1"
        levelLabel.zPosition = 100
        levelLabel.fontSize = HUDSettings.fontSize
        
        jumpButton.name = "jump"
        jumpButton.anchorPoint = CGPoint.zero
        jumpButton.zPosition = Z.HUD
        
//        rightArrow.name = "rightArrow"
//        rightArrow.anchorPoint = CGPoint.zero
//        rightArrow.zPosition = Z.HUD
    }
    
    func setup(size: CGSize) {
        let spacing: CGFloat = 5
        
        pointLabel.position = CGPoint(x: spacing + pointLabel.frame.width/2, y: size.height - pointLabel.frame.height - spacing)
        addChild(pointLabel)
        
        topLabel.position = CGPoint(x: size.width - spacing - topLabel.frame.width/2, y: size.height - topLabel.frame.height - spacing)
        addChild(topLabel)
        
//        leftLifeLabel.lineBreakMode = .byWordWrapping
//        leftLifeLabel.numberOfLines = 2
            
            
        
//        bonusFixedLabel.position = CGPoint(x: size.width - 2*spacing - lifeFixedLabel.frame.width - bonusFixedLabel.frame.width/2, y: size.height - topLabel.frame.height - 2*spacing - lifeFixedLabel.frame.height)
//        addChild(bonusFixedLabel)
        
        
//        bonusLabel.lineBreakMode = .byWordWrapping
//        bonusLabel.numberOfLines = 2
        
        bonusLabel.position = CGPoint(x: size.width / 2, y: pointLabel.position.y)
        
        bonusLabel.horizontalAlignmentMode = .center
        addChild(bonusLabel)
        
        lifeLabel.position = CGPoint(x: size.width / 2, y: bonusLabel.position.y - lifeLabel.frame.size.height)
        addChild(lifeLabel)

        
        levelLabel.position = CGPoint(x: spacing + levelLabel.frame.width / 2, y: pointLabel.position.y -  bonusLabel.frame.height)
        addChild(levelLabel)
        
        nameFixedLabel.position = CGPoint(x: levelLabel.position.x, y: bonusFixedLabel.position.y)
        addChild(nameFixedLabel)
        
        self.jumpButton.position = CGPoint(x: spacing, y: spacing)
        jumpButton.size.width = size.width - (spacing * 2)
        self.addChild(jumpButton)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
