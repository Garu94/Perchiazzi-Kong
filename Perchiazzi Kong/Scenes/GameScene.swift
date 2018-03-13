//
//  GameScene.swift
//  Perchiazzi Kong
//
//  Created by Simone Garuglieri on 08/03/2018.
//  Copyright © 2018 Simone Garuglieri. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
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
    var platform1 = Platform(texture: nil, color: .red, size: SpriteSize.platform)
    var platform2 = Platform(texture: nil, color: .green, size: SpriteSize.platform)
    var platform3 = Platform(texture: nil, color: .yellow, size: SpriteSize.platform)
    var platform4 = Platform(texture: nil, color: .white , size: SpriteSize.platform)
    var platform5 = Platform(texture: nil, color: .blue, size: SpriteSize.platform)
    var platform6 = Platform(texture: nil, color: .cyan, size: SpriteSize.platform)
    var platform7 = Platform(texture: nil, color: .brown, size: SpriteSize.platform)
    var platform8 = Platform(texture: nil, color: .orange, size: SpriteSize.platform)
    var platform9 = Platform(texture: nil, color: .magenta, size: SpriteSize.platform)
    var platform10 = Platform(texture: nil, color: .purple, size: SpriteSize.platform)
    
    var ladder1 = Ladder(texture: nil, color: .brown, size: SpriteSize.ladder)
    
    var barrel1 = Barrel(texture: nil, color: .white, size: SpriteSize.barrel)
    
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
        backgroundColor = .black
        platform1.setup(position: CGPoint(x: view.frame.midX + 80, y: view.frame.maxY - 50), rotation: -(.pi / 2.03))
        addChild(platform1)
        platform2.setup(position: CGPoint(x: view.frame.midX - 80, y: view.frame.maxY - 100), rotation: (.pi / 2.03))
        addChild(platform2)
        platform3.setup(position: CGPoint(x: view.frame.midX + 80, y: view.frame.maxY - 150), rotation: -(.pi / 2.03))
        addChild(platform3)
        platform4.setup(position: CGPoint(x: view.frame.midX - 80, y: view.frame.maxY - 200), rotation: (.pi / 2.03))
        addChild(platform4)
        platform5.setup(position: CGPoint(x: view.frame.midX + 80, y: view.frame.maxY - 250), rotation: -(.pi / 2.03))
        addChild(platform5)
        platform6.setup(position: CGPoint(x: view.frame.midX - 80, y: view.frame.maxY - 300), rotation: (.pi / 2.03))
        addChild(platform6)
        platform7.setup(position: CGPoint(x: view.frame.midX + 80, y: view.frame.maxY - 350), rotation: -(.pi / 2.03))
        addChild(platform7)
        platform8.setup(position: CGPoint(x: view.frame.midX - 80, y: view.frame.maxY - 400), rotation: (.pi / 2.03))
        addChild(platform8)
        platform9.setup(position: CGPoint(x: view.frame.midX + 80, y: view.frame.maxY - 450), rotation: -(.pi / 2.03))
        addChild(platform9)
        platform10.setup(position: CGPoint(x: view.frame.midX, y: view.frame.maxY - 550), rotation: .pi / 2)
        addChild(platform10)
        
        ladder1.setup(position: CGPoint(x:view.frame.midX, y: view.frame.midY+265))
        addChild(ladder1)
        
        barrel1.setup(position: CGPoint(x: view.frame.maxX - 50, y: view.frame.maxY))
        addChild(barrel1)
        
        //Player
        mario.setup(view: self.view!)
        addChild(mario)
        
        //Kong
        kong.setup(view: self.view!)
        addChild(kong)
        
        //HUD
        hud.setup(size: self.size)
        addChild(hud)
        
        debugDrawPlayableArea()
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
        barrel1.checkPosition(playableZone: playableRect)
        
        if lastTime <= 0 { lastTime = currentTime }
        //update deltaTime = time interval between two frames
        deltaTime = currentTime - lastTime
        //set last frame time to current time
        lastTime = currentTime
        
        mario.move(deltaTime: deltaTime, direction: direction)
        
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
