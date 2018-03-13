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
    static let fontSize: CGFloat = 10
}

class HUD: SKNode {

    
    let jumpButton = SKSpriteNode(texture: nil, color: .red, size: SpriteSize.button)
//    let rightArrow = SKSpriteNode(texture: nil, color: .red, size: SpriteSize.button)
    var pointLabel = SKLabelNode(fontNamed: HUDSettings.font)//saltare barile e non morire
    var topLabel = SKLabelNode(fontNamed: HUDSettings.font)
    var leftLifeLabel = SKLabelNode(fontNamed: HUDSettings.font) //3-> barrel
    var bonusLabel = SKLabelNode(fontNamed: HUDSettings.font) //5000
    var levelLabel = SKLabelNode(fontNamed: HUDSettings.font) //1
    let bonusFixedLabel = SKLabelNode(fontNamed: HUDSettings.font)
    let lifeFixedLabel = SKLabelNode(fontNamed: HUDSettings.font)
    let nameFixedLabel = SKLabelNode(fontNamed: HUDSettings.font)
    
    override init() {
        super.init()
        self.name = "HUD"
        
        pointLabel.text = "I-000000"
        pointLabel.zPosition = 100
        pointLabel.fontSize = HUDSettings.fontSize
        
        topLabel.text = "TOP: 000000"
        topLabel.zPosition = 100
        topLabel.fontSize = HUDSettings.fontSize
        
        bonusFixedLabel.text = "BONUS"
        bonusFixedLabel.zPosition = 100
        bonusFixedLabel.fontSize = HUDSettings.fontSize
        
        lifeFixedLabel.text = "L"
        lifeFixedLabel.zPosition = 100
        lifeFixedLabel.fontSize = HUDSettings.fontSize
        
        nameFixedLabel.text = "D"
        nameFixedLabel.zPosition = 100
        nameFixedLabel.fontSize = HUDSettings.fontSize
        
        leftLifeLabel.text = "3"
        leftLifeLabel.zPosition = 100
        leftLifeLabel.fontSize = HUDSettings.fontSize
        
        bonusLabel.text = "5000"
        bonusLabel.zPosition = 100
        bonusLabel.fontSize = HUDSettings.fontSize
        
        levelLabel.text = "1"
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
        let spacing: CGFloat = 10
        
        pointLabel.position = CGPoint(x: spacing + pointLabel.frame.width/2, y: size.height - pointLabel.frame.height - spacing)
        addChild(pointLabel)
        
        topLabel.position = CGPoint(x: size.width - spacing - topLabel.frame.width/2, y: size.height - topLabel.frame.height - spacing)
        addChild(topLabel)
        
        lifeFixedLabel.position = CGPoint(x: size.width - spacing - leftLifeLabel.frame.width/2, y: size.height - topLabel.frame.height - 2*spacing - lifeFixedLabel.frame.height)
        addChild(lifeFixedLabel)
//        leftLifeLabel.lineBreakMode = .byWordWrapping
//        leftLifeLabel.numberOfLines = 2
            
            
        leftLifeLabel.position = CGPoint(x: size.width - spacing - leftLifeLabel.frame.width/2, y: size.height - topLabel.frame.height - 2*spacing - lifeFixedLabel.frame.height - leftLifeLabel.frame.height)
        addChild(leftLifeLabel)
        
        bonusFixedLabel.position = CGPoint(x: size.width - 2*spacing - leftLifeLabel.frame.width - bonusLabel.frame.width/2, y: size.height - topLabel.frame.height - 2*spacing - lifeFixedLabel.frame.height)
        addChild(bonusFixedLabel)
        
        
//        bonusLabel.lineBreakMode = .byWordWrapping
//        bonusLabel.numberOfLines = 2
        bonusLabel.position = CGPoint(x: size.width - 2*spacing - leftLifeLabel.frame.width - bonusLabel.frame.width/2, y: size.height - topLabel.frame.height - 2*spacing - lifeFixedLabel.frame.height - leftLifeLabel.frame.height)
        addChild(bonusLabel)
        
//        levelLabel.lineBreakMode = .byWordWrapping
//        levelLabel.numberOfLines = 2

        
        levelLabel.position = CGPoint(x: bonusLabel.position.x - bonusLabel.frame.width, y: bonusLabel.position.y)
        addChild(levelLabel)
        
        nameFixedLabel.position = CGPoint(x: levelLabel.position.x, y: bonusFixedLabel.position.y)
        addChild(nameFixedLabel)
        
        self.jumpButton.position = CGPoint(x: spacing, y: spacing)
        jumpButton.size.width = size.width - (spacing * 2)
        self.addChild(jumpButton)
//        let xRightArrow = size.width - spacing - rightArrow.size.width
//        self.rightArrow.position = CGPoint(x: xRightArrow, y: spacing)
//        self.addChild(rightArrow)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
