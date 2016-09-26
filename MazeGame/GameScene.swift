//
//  GameScene.swift
//  MazeGame
//
//  Created by Knowledge Is Power. on 7/4/16.
//  Copyright (c) 2016 Dhruv Rajesh. All rights reserved.
//

import SpriteKit
import CoreMotion


class GameScene: SKScene, SKPhysicsContactDelegate
{
    let manager = CMMotionManager()
    var player = SKSpriteNode()
    var endNode = SKSpriteNode()

    
    
    override func didMoveToView(view: SKView)
    {
        player=self.childNodeWithName("player") as! SKSpriteNode
        endNode=self.childNodeWithName("endNode") as! SKSpriteNode
               
        
        self.physicsWorld.contactDelegate = self

        manager.startAccelerometerUpdates()
        manager.accelerometerUpdateInterval = 0.1
        manager.startAccelerometerUpdatesToQueue(NSOperationQueue.mainQueue())
        { (data, error) in
            
            // this code helps us to move our objects with the help of physic
            self.physicsWorld.gravity = CGVectorMake(CGFloat((data?.acceleration.x)!)*10, CGFloat((data?.acceleration.y)!)*10)
        }
    }
    
    func didBeginContact(contact: SKPhysicsContact)
    {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB
        
        if bodyA.categoryBitMask == 1 && bodyB.categoryBitMask == 2 ||
            bodyA.categoryBitMask == 2 && bodyB.categoryBitMask == 1
        {
            //End Scene
            let gameSceneTemp = EndScene(fileNamed: "EndScene")
            self.scene!.view?.presentScene(gameSceneTemp!, transition: SKTransition.doorsCloseHorizontalWithDuration(1.0))
            
         /*   let doors = SKTransition.doorwayWithDuration(1.0)
            let secondLevel = SecondLevel(fileNamed: "SecondLevel")
            self.view?.presentScene(secondLevel!, transition: doors)*/
        }
        
        
    }
}


