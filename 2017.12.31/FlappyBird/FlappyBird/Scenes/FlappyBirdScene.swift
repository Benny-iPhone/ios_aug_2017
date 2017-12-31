//
//  FlappyBirdScene.swift
//  FlappyBird
//
//  Created by hackeru on 31/12/2017.
//  Copyright © 2017 iOSHairDesign. All rights reserved.
//

import SpriteKit

enum BitMask : UInt32{
    case bird = 1
    case world = 2
    case pipe = 4
}

class FlappyBirdScene: SKScene , SKPhysicsContactDelegate{
    
    let bird : Bird
    
    private func createWorld(){
        
        bird.position = CGPoint(x: size.width / 4, y: size.height / 2)
        
        self.addChild(bird)
        
        bird.flapForever()
        
        //Setup Ground
        
        let groundTexture = SKTexture(image: #imageLiteral(resourceName: "Ground")) //Ground
        groundTexture.filteringMode = .nearest
        let gWidth = groundTexture.size().width * 2
        let gCount = (size.width / gWidth) + 3
        
        let moveGroundAction = SKAction.moveBy(x: -gWidth,
                                               y: 0,
                                               duration: TimeInterval(0.02 * gWidth))
        let resetGroundAction = SKAction.moveBy(x: gWidth, y: 0, duration: 0)
        let groundSeq = SKAction.sequence([
            moveGroundAction,
            resetGroundAction
            ])
        let groundAction = SKAction.repeatForever(groundSeq)
        
        
        for i in 0..<Int(gCount){
            let node = SKSpriteNode(texture: groundTexture)
            node.setScale(2)
            node.position = CGPoint(x: CGFloat(i) * node.size.width,
                                    y: node.size.height / 2)
            
            self.addChild(node)
            
            node.run(groundAction)
        }
        
        
        //Setup Skyline
        
        let skyTexture = SKTexture(image: #imageLiteral(resourceName: "Skyline")) //Skyline
        skyTexture.filteringMode = .nearest
        
        let sWidth = skyTexture.size().width
        let sCount = (size.width / sWidth) + 3
        
        let gFactor = groundTexture.size().height * 2
        
        let moveSkyAction = SKAction.moveBy(x: -sWidth,
                                            y: 0,
                                            duration: TimeInterval(0.1 * sWidth))
        let resetSkyAction = SKAction.moveBy(x: sWidth, y: 0, duration: 0)
        let skySeq = SKAction.sequence([
            moveSkyAction,
            resetSkyAction
            ])
        let skyAction = SKAction.repeatForever(skySeq)
        
        for i in 0..<Int(sCount){
            let node = SKSpriteNode(texture: skyTexture)
            node.setScale(2)
            node.zPosition = -20
            node.position = CGPoint(x: CGFloat(i) * node.size.width,
                                    y: node.size.height / 2 + gFactor)
            
            self.addChild(node)
            
            node.run(skyAction)
        }
        
        //ground dummy node
        
        let dummyNode = SKNode()
        dummyNode.position = CGPoint(x: 0, y: groundTexture.size().height)
        
        dummyNode.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: size.width, height: groundTexture.size().height * 2))
        
        dummyNode.physicsBody?.isDynamic = false
        dummyNode.physicsBody?.categoryBitMask = BitMask.world.rawValue
        
        
        self.addChild(dummyNode)
        
        //physic world
        
        self.physicsWorld.gravity = CGVector(dx: 0.0, dy: -3)
        self.physicsWorld.contactDelegate = self
        
        
        //spawn pipes
        let groundYValue = groundTexture.size().height
        
        let spawnAction = SKAction.run {
            let pair = PipesPair.createPipes(self.size, groundY: groundYValue)
            self.addChild(pair)
        }
        let delayAction = SKAction.wait(forDuration: 2)
        let spawnSeq = SKAction.sequence([spawnAction,delayAction])
        self.run(SKAction.repeatForever(spawnSeq))
    }
    
    override init(size: CGSize) {
        self.bird = Bird.createBird()
        
        super.init(size: size)
        
        self.backgroundColor = UIColor(red: 113.0/255.0,
                                       green: 197.0/255.0,
                                       blue: 207.0/255.0,
                                       alpha: 1)
        
        createWorld()
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        bird.pulseUp()
        
        /*
        if let t = touches.first,
            let node = self.nodes(at: t.location(in: self)).first as? Bird{
                node.pulseUp()
        }
 */
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        self.removeAllActions()
        self.removeAllChildren()
        self.removeAction(forKey: "flash")
        
        
        let redAction = SKAction.run {
            self.backgroundColor = .red
        }
        
        let normalAction = SKAction.run {
            self.backgroundColor = UIColor(red: 113.0/255.0,
                                           green: 197.0/255.0,
                                           blue: 207.0/255.0,
                                           alpha: 1)
        }
        
        let delayAction = SKAction.wait(forDuration: 0.15)
        
        let seq = SKAction.sequence([delayAction,redAction,delayAction,normalAction])
        let repeatAction = SKAction.repeat(seq, count: 4)
        let restartAction = SKAction.run {
            self.createWorld()
        }
        //self.run(repeatAction, withKey: "flash")
        self.run(SKAction.sequence([repeatAction,restartAction]), withKey: "falsh")
        
    }
    
    
}














