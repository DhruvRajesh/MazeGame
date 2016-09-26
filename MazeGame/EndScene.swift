//
//  EndScene.swift
//  MazeGame
//
//  Created by Knowledge Is Power. on 7/12/16.
//  Copyright © 2016 Dhruv Rajesh. All rights reserved.
//

import SpriteKit
import UIKit

class EndScene: SKScene
{
    
    override func didMoveToView(view: SKView)
    {
        let myLabel = SKLabelNode(fontNamed:"Chalkduster")
        myLabel.text = "You Win!"
        myLabel.fontSize = 45
        myLabel.position = CGPoint(x:CGRectGetMidX(self.frame), y:CGRectGetMidY(self.frame))
        
        self.addChild(myLabel)
    }
}




