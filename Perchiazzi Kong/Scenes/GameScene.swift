//
//  GameScene.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 08/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate, UIGestureRecognizerDelegate {
    
    let playableRect: CGRect

    // Update Timer
    var lastTime: Double = 0.0
    var deltaTime: Double = 0.0
    
    //HUD
    let hud = HUD()
    let pointString = "I: "
    
    //Movement
    var direction: Direction = Direction.stop
    //    var rightArrowIsPressed: Bool = false
    //    var leftArrowisPressed: Bool = false
    
    //MARK: Declarations
//    //Princess Platform
//    var platform1 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 60))
//
//    //Perchiazzi-Kong Platform
//    var platform2 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 175))
//
//    //Floor 1
//    var platform3 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 60))
//    var platform4 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 180))
//    var elevator1 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
//    var platform5 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 35))
//    var elevator2 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
//
//    //Floor 2
//    var platform6 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 75))
//    var platform7 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 160))
//    var platform8 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 40))
//
//    //Floor 3
//    var platform9 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 60))
//    var platform10 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 180))
//
//    var platform11 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 35))
//
//    var elevatorX = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
//
  
    //Base Floof
    var baseElevator1 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
    var basePlatform1 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 105))
    var baseElevator2 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
    var basePlatform2 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 128))
  
    //First Floor
    var platform1 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 110))
  
    var barrel1 = Barrel()
    var barrel2 = Barrel()
    //player
    let mario = Player()
    let kong = Boss()
    
    override init(size: CGSize) {
        playableRect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func debugDrawPlayableArea() {
        let shape = SKShapeNode(rect: playableRect)
        shape.strokeColor = SKColor.red
        shape.lineWidth = 4.0
        addChild(shape)
    }
    
    //Before the Scene
    override func sceneDidLoad() {
        self.physicsWorld.contactDelegate = self
        self.physicsWorld.gravity = CGVector(dx:0, dy: -9.8)
    }
    
    override func didMove(to view: SKView) {
        backgroundColor = .gray
        
        let space: CGFloat = SpriteSize.elevator.width
        let distance: CGFloat = 100
        
//        //Princess Platform SETUP
//        platform1.setup(rotation: 0, xPosition: Float(view.frame.width - platform1.frame.height/2), leftHeight: Float(view.frame.maxY - 75))
//
//        //Perchiazzi-Kong Platform SETUP
//        platform2.setup(rotation: 0, xPosition: Float(platform2.size.height/2), leftHeight: Float(view.frame.maxY - 155))
//
//        //Floor 1 SETUP
//        platform3.setup(rotation: 0.08, xPosition: Float(view.frame.width - platform3.size.height/2), leftHeight: Float(platform2.position.y - distance))
//
//        platform4.setup(rotation: 0.08, xPosition: Float(platform3.position.x - platform3.size.height/2 - space - platform4.size.height/2), leftHeight: Float(platform3.position.y - 28))
//
//        elevator1.setup(position: CGPoint(x: platform1.position.x - platform1.size.height/2 - elevator1.size.width/2, y: platform1.position.y))
//        elevator1.move(amountToMove: 155)
//
//        platform5.setup(rotation: 0.08, xPosition: Float(platform4.position.x - platform4.size.height/2 - space - platform5.size.height/2), leftHeight: Float(platform3.position.y - 28))
//
//        elevator2.setup(position: CGPoint(x: platform5.position.x + platform5.size.height, y: platform5.position.y))
//        elevator2.move(amountToMove: 110)
      
//        //Floor 2 SETUP
//        platform6.setup(rotation: -0.08, xPosition: Float(platform6.size.height/2), leftHeight: Float(platform5.position.y - distance))
//        
//        platform7.setup(rotation: -0.08, xPosition: Float(platform6.position.x + platform6.size.height/2 + space + platform7.size.height/2), leftHeight: Float(platform6.position.y))
//        
//        platform8.setup(rotation: -0.08, xPosition: Float(platform7.position.x + platform7.size.height/2 + space + platform8.size.height/2), leftHeight: Float(platform6.position.y))
//        
//        //Floor 3 SETUP
//        platform9.setup(rotation: 0.08, xPosition: Float(view.frame.width - platform9.size.height/2), leftHeight: Float(platform8.position.y - distance))
//        
//        platform10.setup(rotation: 0.08, xPosition: Float(platform9.position.x - platform9.size.height/2 - space - platform10.size.height/2), leftHeight: Float(platform9.position.y - 28))
//        
//        platform11.setup(rotation: 0.08, xPosition: Float(platform10.position.x - platform10.size.height/2 - space - platform11.size.height/2), leftHeight: Float(platform9.position.y - 28))
//        
    

      //MARK: HUD SETUP
      hud.setup(size: self.size)
      addChild(hud)
      
      //MARK: Base Floor SETUP
      baseElevator1.setup(position: CGPoint(x: baseElevator1.size.width/2, y: hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + baseElevator1.frame.height/2))
      baseElevator1.moveVertically(amountToMove: 80, time: 2)
      addChild(baseElevator1)
      
      basePlatform1.setup(rotation: 0, xPosition: Float(baseElevator1.frame.width + basePlatform1.size.height/2), leftHeight: Float(hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + basePlatform1.size.width/2))
      addChild(basePlatform1)
      
      baseElevator2.setup(position: CGPoint(x: basePlatform1.position.x + basePlatform1.size.height/2 + baseElevator2.size.width/2, y: hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + baseElevator2.frame.height/2))
      baseElevator2.moveHorizontally(amountToMove: 65, time: 2)
      addChild(baseElevator2)
      
      basePlatform2.setup(rotation: 0, xPosition: Float(baseElevator2.position.x + baseElevator2.size.width + 65 + basePlatform2.size.height/2), leftHeight: Float(hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + basePlatform2.size.width/2))
      addChild(basePlatform2)
      
      
      //MARK: First Floor SETUP
      platform1.simpleSetup(rotation: degreeToRadians(degree: 90), position: CGPoint(x: baseElevator1.position.x + baseElevator1.size.width/2, y: baseElevator1.position.y + 80))
      addChild(platform1)
      
        
        barrel1.setup(position: CGPoint(x: view.frame.minX + 400, y: view.frame.maxY))
//        addChild(barrel1)
        barrel2.setup(position: CGPoint(x: view.frame.minX + 100, y: mario.position.y + 100))
//        addChild(barrel2)
      
        //Kong
        kong.setup(view: self.view!)
        addChild(kong)
        
        //Player
        mario.setup(view: self.view!)
        addChild(mario)

        GameManager.shared.startTimer(label: hud.bonusLabel)
        debugDrawPlayableArea()
    }
  
  func degreeToRadians(degree: CGFloat) -> CGFloat {
    return (degree * .pi)/180
  }
  
    //MARK: Physic Collision
    func didBegin(_ contact: SKPhysicsContact) {
//            debugPrint("bodyA: \(contact.bodyA.node!.name!)")
//            debugPrint("bodyB: \(contact.bodyB.node!.name!)")
        if (contact.bodyA.categoryBitMask == PhysicsMask.player) {
            
            if (contact.bodyB.categoryBitMask == PhysicsMask.barrel) {
                mario.die()
                self.isUserInteractionEnabled = false
                GameManager.shared.life -= 1
                checkUltimateDeath()
            }
        }
        
    }
    
    func checkUltimateDeath() {
        let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
        if GameManager.shared.life == 0 {
            let endScene = EndScene(size: size)
            endScene.scaleMode = scaleMode
            // 2
            
            // 3
            view?.presentScene(endScene, transition: reveal)
        } else {
            let gameScene = GameScene(size: size)
            gameScene.scaleMode = scaleMode
            view?.presentScene(gameScene, transition: reveal)
        }
    }
    
    
  
    
    override func update(_ currentTime: TimeInterval) {
        if lastTime <= 0 { lastTime = currentTime }
        //update deltaTime = time interval between two frames
        deltaTime = currentTime - lastTime
        //set last frame time to current time
        lastTime = currentTime
        
        mario.move(deltaTime: deltaTime, direction: direction)
        
       barrel1.checkPosition(playableZone: playableRect)
        mario.checkBorderCollision(playableZone: playableRect)
        
        if GameManager.shared.bonus == 0 {
            GameManager.shared.stopTimer()
        }
    }
    
    func touchDown(atPoint pos: CGPoint) {
        //With AtPoint
        let touchNode = self.atPoint(pos)
        if touchNode.name == "jump" {
            mario.jump()
            return
        } else {
            mario.isRunning = true
            mario.animate(type: "run")
        }
        
        if pos.x > (self.size.width / 2) {
            direction = .right
            return
        } else if pos.x < (self.size.width / 2) && touchNode.name != "jump" {
            direction = .left
            return
        }
        
    }
    
    func touchMove(toPoint pos: CGPoint) {
        let touchNode = self.atPoint(pos)
        if touchNode.name != "jump" {
            if pos.x > (self.size.width / 2) {
                direction = .right
                return
            } else if pos.x < (self.size.width / 2) && !mario.isJumping {
                direction = .left
                return
            }
        }
    }
    
    func touchUp(atPoint pos: CGPoint) {
        //With AtPoint
        
        let touchNode = self.atPoint(pos)
        
        if touchNode.name != "jump" {
            direction = .stop
            mario.animate(type: "idle")
            mario.isRunning = false
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchDown(atPoint: t.location(in: self))
            
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchMove(toPoint: t.location(in: self))
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches {
            self.touchUp(atPoint: t.location(in: self))
            
        }
    }
}
