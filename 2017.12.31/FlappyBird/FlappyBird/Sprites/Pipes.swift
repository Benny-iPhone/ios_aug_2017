//
//  Pipes.swift
//  FlappyBird
//
//  Created by hackeru on 31/12/2017.
//  Copyright © 2017 iOSHairDesign. All rights reserved.
//

import SpriteKit

class PipesPair: SKNode {
    class func createPipes(_ sceneSize : CGSize, groundY : CGFloat) -> PipesPair
    {
        let txt1 = SKTexture(image: #imageLiteral(resourceName: "Pipe1")) //pipe1
        let txt2 = SKTexture(image: #imageLiteral(resourceName: "Pipe2")) //pipe2
        
        txt1.filteringMode = .nearest
        txt2.filteringMode = .nearest
        
        let pair = PipesPair()
        pair.position = CGPoint(x: sceneSize.width + txt1.size().width * 2, y: 0)
        pair.zPosition = -10
        //bottom pipe
        let bottomPipe = SKSpriteNode(texture: txt1)
        bottomPipe.setScale(2)
        
        let h = (sceneSize.height - groundY) / 3
        
        let randomY = CGFloat(arc4random_uniform(UInt32(h)))
        bottomPipe.position = CGPoint(x: 0, y: randomY + groundY)
        
        bottomPipe.physicsBody = SKPhysicsBody(rectangleOf: bottomPipe.size)
        bottomPipe.physicsBody?.isDynamic = false
        bottomPipe.physicsBody?.categoryBitMask = BitMask.pipe.rawValue
        bottomPipe.physicsBody?.contactTestBitMask = BitMask.bird.rawValue
        
        pair.addChild(bottomPipe)
        
        //top pipe
        let topPipe = SKSpriteNode(texture: txt2)
        topPipe.setScale(2)
        topPipe.position = CGPoint(x: 0, y: bottomPipe.position.y + 100 + topPipe.size.height)
        
        topPipe.physicsBody = SKPhysicsBody(rectangleOf: topPipe.size)
        topPipe.physicsBody?.isDynamic = false
        topPipe.physicsBody?.categoryBitMask = BitMask.pipe.rawValue
        topPipe.physicsBody?.contactTestBitMask = BitMask.bird.rawValue
        
        pair.addChild(topPipe)
        
        let distance = sceneSize.width * 1.3
        let moveAction = SKAction.moveBy(x: -distance,
                                         y: 0,
                                         duration: TimeInterval(0.01 * distance))
        
        let removeAction = SKAction.removeFromParent()
        let seq = SKAction.sequence([moveAction,removeAction])
        
        pair.run(seq)
        
        return pair
    }
}

















