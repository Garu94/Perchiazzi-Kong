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
    
    //Movement
    var direction: Direction = Direction.stop
    //    var rightArrowIsPressed: Bool = false
    //    var leftArrowisPressed: Bool = false
    
    //Mockup Scenario
    var platform1 = Platform(texture: nil, color: .red, size: CGSize(width: 10, height: 200))
    var platform2 = Platform(texture: nil, color: .green, size: CGSize(width: 10, height: 40))
    
    var platform3 = Platform(texture: nil, color: .yellow, size: CGSize(width: 10, height: 200))
    
    var platform4 = Platform(texture: nil, color: .white , size: CGSize(width: 10, height: 100))
    
    var platform5 = Platform(texture: nil, color: .blue, size: CGSize(width: 10, height: 250))
    
    var platform6 = Platform(texture: nil, color: .cyan, size: CGSize(width: 10, height: 120))
    
    var platform7 = Platform(texture: nil, color: .brown, size: CGSize(width: 10, height: 160))
    
    var platform8 = Platform(texture: nil, color: .orange, size: CGSize(width: 10, height: 275))
    
    var lastPlatform = Platform(texture: nil, color: .black, size: CGSize(width: 500, height: 500))
    
    var ladder1 = Ladder(texture: nil, color: .brown, size: SpriteSize.ladder)
    
    var barrel1 = Barrel()
    
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
        
        let space: CGFloat = 25
        let distance: CGFloat = 50
        
        //ROSSA
        platform1.setup(rotation: -0.01, xPosition: Float(platform1.size.height/2), leftHeight: Float(view.frame.maxY - 70))
        addChild(platform1)
        
        //VERDE
        platform2.setup(rotation: -(.pi/45), xPosition: Float(platform1.size.height + platform2.size.height/2), leftHeight: Float(platform1.position.y+13))
        addChild(platform2)
        
        //GIALLA
        platform3.setup(rotation: 0.01, xPosition: Float(view.frame.width - platform3.size.height/2), leftHeight: Float(platform1.position.y - distance))
        addChild(platform3)
        
        //BIANCA
        platform4.setup(rotation: 0.01, xPosition: Float(view.frame.width - platform3.size.height - platform4.size.height/2 - space), leftHeight: Float(platform1.position.y - distance))
        addChild(platform4)
        
        //BLU
        platform5.setup(rotation: -0.01, xPosition: Float(platform5.size.height/2), leftHeight: Float(platform4.position.y - distance))
        addChild(platform5)
        
        //AZZURRA
        platform6.setup(rotation: 0.01, xPosition: Float(view.frame.width - platform6.size.height/2), leftHeight: Float(platform5.position.y - distance))
        addChild(platform6)
        
        //MARRONE
        platform7.setup(rotation: 0.01, xPosition: Float(view.frame.width - platform6.size.height - platform7.size.height/2 - space), leftHeight: Float(platform5.position.y - distance))
        addChild(platform7)
        
        //ARANCIONE
        platform8.setup(rotation: -0.01, xPosition: Float(platform8.size.height/2), leftHeight: Float(platform7.position.y - distance))
        addChild(platform8)
        
        //NERA
        lastPlatform.setup(rotation: 0, xPosition: Float(view.frame.width/2), leftHeight: 80)
        addChild(lastPlatform)
        
        ladder1.setup(position: CGPoint(x: platform8.frame.width, y: platform8.frame.minY - ladder1.frame.height/2))
        addChild(ladder1)
        
        barrel1.setup(position: CGPoint(x: view.frame.minX + 100, y: view.frame.maxY))
        addChild(barrel1)
        
        
        //Get multiple touches
        self.view?.isMultipleTouchEnabled = true
        
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(jumpOnSecondtouch))
        tapGR.delegate = self
        tapGR.numberOfTapsRequired = 2
        view.addGestureRecognizer(tapGR)
        
        //Player
        mario.setup(view: self.view!)
        addChild(mario)
        
        //Kong
        kong.setup(view: self.view!)
        addChild(kong)
        
        //HUD
        hud.setup(size: self.size)
        addChild(hud)
        
        GameManager.shared.startTimer(label: hud.bonusLabel)
        
        debugDrawPlayableArea()
    }
    
    @objc func jumpOnSecondtouch() {
        mario.jump()
    }
    
    //Physic Collision
    func didBegin(_ contact: SKPhysicsContact) {
        //    debugPrint("bodyA: \(contact.bodyA.node!.name!)")
        //    debugPrint("bodyB: \(contact.bodyB.node!.name!)")
        
        if (contact.bodyA.categoryBitMask == PhysicsMask.ladder) {
            //      debugPrint("ladder hit something")
            
            //Barrel hits ladder
            if (contact.bodyB.node!.name! == "barrel") {
                //        debugPrint("What? a barrel!")
                let barrel = contact.bodyB.node! as? Barrel
                barrel?.fall()
            }
        }
    }
    
    //Simple Collision
    var isFallen = false
    func checkCollisions() {
        enumerateChildNodes(withName: "barrel") { barrel, stop in
            self.enumerateChildNodes(withName: "ladder") { ladder, stop in
                if !self.isFallen {
                    if barrel.frame.intersects(ladder.frame) {
                        debugPrint("intersected!")
                        
                        //          let fall = SKAction.move(to: CGPoint(x: 0, y:0), duration: 2.0)
                        //          barrel.run(fall)
                        barrel.position = CGPoint(x: barrel.position.x, y: barrel.position.y - 30)
                        self.isFallen = true
                    }
                }
                
            }
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        if lastTime <= 0 { lastTime = currentTime }
        //update deltaTime = time interval between two frames
        deltaTime = currentTime - lastTime
        //set last frame time to current time
        lastTime = currentTime
        
        mario.move(deltaTime: deltaTime, direction: direction)
        
        if GameManager.shared.life == 0 {
            let endScene = EndScene(size: size)
            endScene.scaleMode = scaleMode
            // 2
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            // 3
            view?.presentScene(endScene, transition: reveal)
        }
        
       barrel1.checkPosition(playableZone: playableRect)
        
        debugPrint(mario.position)
        //    checkCollisions()
    }
    
    func touchDown(atPoint pos: CGPoint) {
        //With AtPoint
        let touchNode = self.atPoint(pos)
        if touchNode.name == "jump" {
            mario.jump()
            return
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
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for (index, t) in touches.enumerated() {
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
