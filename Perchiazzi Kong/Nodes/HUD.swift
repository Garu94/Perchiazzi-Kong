//
//  HUD.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 12/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit

class HUD: SKNode {

    
    let jumpButton = SKSpriteNode(texture: nil, color: .red, size: SpriteSize.button)
//    let rightArrow = SKSpriteNode(texture: nil, color: .red, size: SpriteSize.button)
    
    
    override init() {
        super.init()
        self.name = "HUD"
        
        jumpButton.name = "jump"
        jumpButton.anchorPoint = CGPoint.zero
        jumpButton.zPosition = Z.HUD
        
//        rightArrow.name = "rightArrow"
//        rightArrow.anchorPoint = CGPoint.zero
//        rightArrow.zPosition = Z.HUD
    }
    
    func setup(size: CGSize) {
        let spacing: CGFloat = 10
        
        self.jumpButton.position = CGPoint(x: spacing, y: spacing)
        self.addChild(jumpButton)
//        let xRightArrow = size.width - spacing - rightArrow.size.width
//        self.rightArrow.position = CGPoint(x: xRightArrow, y: spacing)
//        self.addChild(rightArrow)
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
