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
    
    debugDrawPlayableArea()
  }
  
  func checkCollisions() {
    enumerateChildNodes(withName: "barrel") { barrel, stop in
      self.enumerateChildNodes(withName: "ladder") { ladder, stop in
        if barrel.frame.intersects(ladder.frame) {
          debugPrint("intersected!")

//          let fall = SKAction.move(to: CGPoint(x: 0, y:0), duration: 2.0)
//          barrel.run(fall)
          
          barrel.position = CGPoint(x: barrel.position.x, y: barrel.position.y - 30)
        }
        
      }
    }
  }
  
  override func update(_ currentTime: TimeInterval) {
    barrel1.checkPosition(playableZone: playableRect)
    
    checkCollisions()
  }
  
}
