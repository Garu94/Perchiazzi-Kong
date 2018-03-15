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
  
  var timerCounterBarrel = 0
  
  var timer1: Timer? {
    willSet {
      timer1?.invalidate()
      timerCounterBarrel = 0
    }
  }
  
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
  
  //Base Floor
  var baseElevator1 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
  var basePlatform1 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 105))
  var baseElevator2 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
  var basePlatform2 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 128))
  
  //First Floor
  var platform1 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 110))
  var elevator2 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
  var platform2 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 104))
  var elevator3 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
  
  //Second Floor
  var platform3 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 90))
  var platform4 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 45))
  var platform5 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 47))
  var elevator4 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
  var platform6 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 40))
  
  //Third Floor
  var platform7 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 200))
  var elevator5 = Elevator(texture: nil, color: .yellow, size: SpriteSize.elevator)
  var platform8 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 100))
  
  //Perchiazzi-Kong Floor
  var kongPlatform = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 150))
  
  //Stefania Floor
  var stefaniaPlatform = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 75))
  
  //Bonus Floor
  var bonusPlatform1 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 35))
  var bonusPlatform2 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 60))
  var bonusPlatform3 = Platform(texture: nil, color: .blue, size: CGSize(width: 12, height: 60))
  
  //Decorations
  let barrelPack = SKSpriteNode(imageNamed: "barrel_pack")
  let singleBarrel = SKSpriteNode(imageNamed: "barrel_single")
  let background = SKSpriteNode(imageNamed: "background_temporary")
    
  //player
  let mario = Player()
  let kong = Boss()
  let princess = Princess()
  
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
//    backgroundColor = .gray
    background.size = CGSize(width: view.frame.width, height: view.frame.height)
    background.position = CGPoint(x: view.frame.midX, y: view.frame.midY)
    addChild(background)
    
    //MARK: HUD SETUP
    hud.setup(size: self.size)
    addChild(hud)
    
    //MARK: Base Floor SETUP
    baseElevator1.setup(position: CGPoint(x: baseElevator1.size.width/2, y: hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + baseElevator1.frame.height/2))
    baseElevator1.moveVertically(amountToMove: 80, time: 2)
    addChild(baseElevator1)
    
    basePlatform1.setup(rotation: 0, xPosition: Float(baseElevator1.frame.width + basePlatform1.size.height/2), leftHeight: Float(hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + basePlatform1.size.width/2))
    basePlatform1.texture = SKTexture(imageNamed: "basePlatform1")
    addChild(basePlatform1)
    
    baseElevator2.setup(position: CGPoint(x: basePlatform1.position.x + basePlatform1.size.height/2 + baseElevator2.size.width + 65, y: hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + baseElevator2.frame.height/2))
    baseElevator2.moveHorizontallyRightLeft(amountToMove: 65, time: 2)
    addChild(baseElevator2)
    
    basePlatform2.setup(rotation: 0, xPosition: Float(baseElevator2.position.x + baseElevator2.size.width/2 + basePlatform2.size.height/2), leftHeight: Float(hud.jumpButton.position.y + hud.jumpButton.size.height + 5 + basePlatform2.size.width/2))
    basePlatform2.texture = SKTexture(imageNamed: "basePlatform2")
    addChild(basePlatform2)
    
    
    //MARK: First Floor SETUP
    platform1.simpleSetup(rotation: degreeToRadians(degree: 90 + 6), position: CGPoint(x: baseElevator1.position.x + baseElevator1.size.width/2 + platform1.size.height/2, y: baseElevator1.position.y + 85 + baseElevator1.size.height/2))
    platform1.texture = SKTexture(imageNamed: "platform1")
    addChild(platform1)
    
    elevator2.zPosition = 200
    elevator2.setup(position: CGPoint(x: platform1.position.x + platform1.size.height/2 + elevator2.size.width/2, y: platform1.position.y + elevator2.size.height/2))
    elevator2.moveHorizontallyLeftRight(amountToMove: 57, time: 2)
    addChild(elevator2)
    
    platform2.simpleSetup(rotation: degreeToRadians(degree: 90 + 6), position: CGPoint(x: elevator2.position.x + elevator2.size.width + 57 + platform2.size.height/2, y: elevator2.position.y + elevator2.size.height/2))
    platform2.texture = SKTexture(imageNamed: "platform2")
    addChild(platform2)
    
    elevator3.setup(position: CGPoint(x: platform2.position.x + platform2.size.height/2 + elevator3.size.width/2, y: platform2.position.y + elevator3.size.height/2))
    elevator3.moveVertically(amountToMove: 80, time: 2)
    addChild(elevator3)
    
    //MARK: Second Floor SETUP
    platform3.simpleSetup(rotation: degreeToRadians(degree: 90 - 6), position: CGPoint(x: view.frame.maxX - platform3.size.height/2 - elevator3.size.width, y: elevator3.position.y + 85 + elevator3.size.height/2))
    platform3.texture = SKTexture(imageNamed: "platform3")
    addChild(platform3)
    
    platform4.simpleSetup(rotation: degreeToRadians(degree: 90 - 6), position: CGPoint(x: platform3.position.x - platform3.size.height - platform4.size.width - 10, y: platform3.position.y + platform3.size.width ))
    platform4.texture = SKTexture(imageNamed: "platform4")
    addChild(platform4)
    
    platform6.simpleSetup(rotation: degreeToRadians(degree: 90 - 6), position: CGPoint(x: platform6.size.height/2, y: 305))
    platform6.texture = SKTexture(imageNamed: "platform6")
    addChild(platform6)
    
    elevator4.setup(position: CGPoint(x: platform6.position.x + platform6.size.height/2 + elevator4.size.width/2, y: platform6.position.y - elevator4.size.height/2 + 2))
    elevator4.moveVertically(amountToMove: 90, time: 2)
    addChild(elevator4)
    
    platform5.simpleSetup(rotation: degreeToRadians(degree: 90 - 6), position: CGPoint(x: elevator4.position.x + elevator4.size.width/2 + platform5.size.height/2, y: elevator4.position.y - elevator4.size.height/2 + 2))
    platform5.texture = SKTexture(imageNamed: "platform5")
    addChild(platform5)
    
    //MARK: Third Floor SETUP
    platform7.simpleSetup(rotation: degreeToRadians(degree: 90 + 6), position: CGPoint(x: elevator4.position.x + elevator4.size.width/2 + platform7.size.height/2, y: elevator4.position.y + 95 + elevator4.size.height))
    platform7.texture = SKTexture(imageNamed: "platform7")
    addChild(platform7)
    
    elevator5.setup(position: CGPoint(x: platform7.position.x + platform7.size.height/2 + elevator5.size.width/2, y: platform7.position.y + elevator5.size.height))
    elevator5.moveVertically(amountToMove: 160, time: 4)
    addChild(elevator5)
    
    platform8.simpleSetup(rotation: degreeToRadians(degree: 90 + 6), position: CGPoint(x: elevator5.position.x + elevator5.size.width/2 + platform8.size.height/2, y: elevator5.position.y + elevator5.size.height/2))
    platform8.texture = SKTexture(imageNamed: "platform8")
    addChild(platform8)
    
    //MARK: Stefania Floor SETUP
    stefaniaPlatform.simpleSetup(rotation: degreeToRadians(degree: 90), position: CGPoint(x: view.frame.width - stefaniaPlatform.size.height/2, y: elevator5.position.y + 160 + elevator5.size.height/2))
    stefaniaPlatform.texture = SKTexture(imageNamed: "stefaniaFloor")
    addChild(stefaniaPlatform)
    
    //MARK: Perchiazzi-Kong Floor SETUP
    kongPlatform.simpleSetup(rotation: degreeToRadians(degree: 90), position: CGPoint(x: kongPlatform.size.height/2, y: stefaniaPlatform.position.y - 37))
    kongPlatform.texture = SKTexture(imageNamed: "kongPlatform")
    addChild(kongPlatform)
    
    //MARK: Bonus Floor SETUP
    bonusPlatform1.simpleSetup(rotation: degreeToRadians(degree: 90), position: CGPoint(x: bonusPlatform1.size.height/2 + 113, y: kongPlatform.position.y - 70))
    bonusPlatform1.texture = SKTexture(imageNamed: "bonusPlatform1")
    addChild(bonusPlatform1)
    
    bonusPlatform2.simpleSetup(rotation: degreeToRadians(degree: 90 + 10), position: CGPoint(x: bonusPlatform1.position.x + bonusPlatform1.size.height/2 + bonusPlatform2.size.height/2, y: bonusPlatform1.position.y + bonusPlatform1.size.width/2 - 1))
    bonusPlatform2.texture = SKTexture(imageNamed: "bonusPlatform2")
    addChild(bonusPlatform2)
    
    bonusPlatform3.simpleSetup(rotation: degreeToRadians(degree: 90 - 10), position: CGPoint(x: bonusPlatform2.position.x + bonusPlatform2.size.height/2 + bonusPlatform3.size.height/2, y: bonusPlatform1.position.y + bonusPlatform1.size.width/2 - 1))
    bonusPlatform3.texture = SKTexture(imageNamed: "bonusPlatform2")
    addChild(bonusPlatform3)
    
    //MARK: Decorations SETUP
    barrelPack.position = CGPoint(x: barrelPack.size.width/2 + 5, y: stefaniaPlatform.position.y + 2)
    addChild(barrelPack)
    singleBarrel.position = CGPoint(x: barrelPack.size.width + 2 + singleBarrel.size.width/2, y: kongPlatform.position.y + 22)
    singleBarrel.size = CGSize(width: 20, height: 33)
    addChild(singleBarrel)
    
    //MARK: Kong SETUP
    kong.setup(view: self.view!)
    addChild(kong)
    
    //MARK: Player SETUP
    mario.setup(view: self.view!)
    addChild(mario)
    
    //MARK: Princess SETUP
    princess.setup(view: self.view!)
    addChild(princess)
    
    startTimerForBarrel()
    GameManager.shared.startTimer(label: hud.bonusLabel)
    //        debugDrawPlayableArea()
  }
  
  func degreeToRadians(degree: CGFloat) -> CGFloat {
    return (degree * .pi)/180
  }
  
  //MARK: Physic Collision
  func didBegin(_ contact: SKPhysicsContact) {
    if (contact.bodyA.categoryBitMask == PhysicsMask.player) {
      
//        if contact.bodyB.categoryBitMask == PhysicsMask.elevator {
//            let elevator = contact.bodyB.node! as! Elevator
//            mario.position.x = elevator.position.x
//        }
        
      if (contact.bodyB.categoryBitMask == PhysicsMask.barrel) {
        mario.die()
        self.isUserInteractionEnabled = false
        checkUltimateDeath()
      }
    }
//    else if contact.bodyB.categoryBitMask == PhysicsMask.player {
//        if contact.bodyA.categoryBitMask == PhysicsMask.elevator {
//            let elevator = contact.bodyA.node! as! Elevator
//            mario.position.x = elevator.position.x
//        }
//    }
  }
  
  func checkUltimateDeath() {
    let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
    if GameManager.shared.life == 0 {
      let endScene = EndScene(size: size)
      endScene.scaleMode = scaleMode
      GameManager.shared.score = 0
      GameManager.shared.bonus = 5000
      GameManager.shared.timerCounter = 0
      GameManager.shared.life = 3
      view?.presentScene(endScene, transition: reveal)
    } else {
      let gameScene = GameScene(size: size)
      gameScene.scaleMode = scaleMode
      view?.presentScene(gameScene, transition: reveal)
    }
  }
  
  func checkfallenDown() {
    if mario.position.y <= playableRect.minY {
      mario.die()
      self.isUserInteractionEnabled = false
      checkUltimateDeath()
    }
  }
  
  func startTimerForBarrel() {
    timer1 = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { t in
      self.timerCounterBarrel += 1
      if self.timerCounterBarrel % 3 == 0 {
        self.spawnBarrel()
      }
    })
  }
  
  func spawnBarrel() {
    let pos = CGPoint(x: self.kong.frame.maxX, y: self.kong.frame.minY)
    kong.animate(type: "action")
    let wait = SKAction.wait(forDuration: 0.8)
    let spawn = SKAction.run {
      let barrel = Barrel()
      barrel.setup(position: pos)
      self.addChild(barrel)
      let randomImpulse = arc4random_uniform(2)
      if randomImpulse == 1 {
        barrel.physicsBody?.applyImpulse(CGVector(dx: 300.0, dy: 0.0))
      } else {
        barrel.physicsBody?.applyImpulse(CGVector(dx: 1000.0, dy: 0.0))
      }
    }
    let wait1 = SKAction.wait(forDuration: 0.4)
    let stopAnimation = SKAction.run {
      self.kong.animate(type: "angry")
    }
    self.run(SKAction.sequence([wait, spawn, wait1, stopAnimation]))
  }
  
  func checkPrincessCollision() {
    if mario.intersects(princess) {
      princess.reachedByPlayer()
    }
  }
  
  func checkBorderCollisionBarrel() {
    enumerateChildNodes(withName: "barrel") { barrel, _ in
      if (barrel.position.x - barrel.frame.size.height/2) <= 0 {
          barrel.physicsBody?.applyImpulse(CGVector(dx: 300, dy: 0))
        }
      
      if (barrel.position.x + barrel.frame.size.height/2) >= self.playableRect.width {
        barrel.physicsBody?.applyImpulse(CGVector(dx: -300, dy: 0))
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
    mario.checkBorderCollision(playableZone: playableRect)
    
    if GameManager.shared.bonus == 0 {
      GameManager.shared.stopTimer()
    }
    
    checkfallenDown()
    checkBorderCollisionBarrel()
    checkPrincessCollision()
  }
  let darioXVelocity = 150
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
    
    if pos.x > (self.size.width / 2) && touchNode.name != "jump" {
      direction = .right
//        mario.physicsBody?.velocity = CGVector(dx: darioXVelocity, dy: 0)
      return
    } else if pos.x < (self.size.width / 2) && touchNode.name != "jump" {
      direction = .left
//        mario.physicsBody?.velocity = CGVector(dx: -darioXVelocity, dy: 0)
      return
    }
    
  }
  
  func touchMove(toPoint pos: CGPoint) {
    let touchNode = self.atPoint(pos)
    if touchNode.name != "jump" {
      if pos.x > (self.size.width / 2) && !mario.isJumping {
        direction = .right
//        mario.physicsBody?.velocity = CGVector(dx: darioXVelocity, dy: 0)
        return
      } else if pos.x < (self.size.width / 2) && !mario.isJumping {
        direction = .left
//        mario.physicsBody?.velocity = CGVector(dx: -darioXVelocity, dy: 0)
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
