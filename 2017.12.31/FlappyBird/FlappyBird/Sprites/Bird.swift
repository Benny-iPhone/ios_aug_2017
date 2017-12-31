//
//  Bird.swift
//  FlappyBird
//
//  Created by hackeru on 31/12/2017.
//  Copyright © 2017 iOSHairDesign. All rights reserved.
//

import SpriteKit

class Bird: SKSpriteNode {
    class func createBird() -> Bird
    {
        
        let texture = SKTexture(image: #imageLiteral(resourceName: "Bird1"))
        texture.filteringMode = .nearest
        
        let bird = Bird(texture: texture)
        bird.setScale(2)
        
        bird.physicsBody = SKPhysicsBody(circleOfRadius: bird.size.height / 2)
        bird.physicsBody?.isDynamic = true
        bird.physicsBody?.allowsRotation = false
        bird.physicsBody?.restitution = 0.2
        
        bird.physicsBody?.categoryBitMask = BitMask.bird.rawValue
        bird.physicsBody?.collisionBitMask = BitMask.world.rawValue | BitMask.pipe.rawValue
        bird.physicsBody?.contactTestBitMask = BitMask.world.rawValue | BitMask.pipe.rawValue

        
        
        return bird
        
    }
    
    func pulseUp(){
        self.physicsBody?.velocity = CGVector.zero
        self.physicsBody?.applyImpulse(CGVector(dx: 0, dy: 4))
    }
    
    func flapForever(){
        let txt1 = SKTexture(image: #imageLiteral(resourceName: "Bird1")) //bird1
        let txt2 = SKTexture(image: #imageLiteral(resourceName: "Bird2")) //bird2
        txt1.filteringMode = .nearest
        txt2.filteringMode = .nearest
        
        let flapAction = SKAction.animate(with: [txt1,txt2], timePerFrame: 0.2)
        let foreverAction = SKAction.repeatForever(flapAction)
        
        self.run(foreverAction)
    }
}
















