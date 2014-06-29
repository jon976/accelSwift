//
//  GameScene.swift
//  accelSwift
//
//  Created by Jon Oransky on 6/28/14.
//  Copyright (c) 2014 self. All rights reserved.
//

import SpriteKit
import CoreMotion

let kPlayerSpeed = 250
let screenSize: CGRect = UIScreen.mainScreen().bounds

class GameScene: SKScene {
    override func didMoveToView(view: SKView) {
        /* Setup your scene here */
        let monkey = SKSpriteNode(imageNamed:"monkey_arms_up")
        monkey.position = CGPointMake(screenSize.width/2, screenSize.height/2);
        self.addChild(monkey)
        let motionManager: CMMotionManager = CMMotionManager()
        if (motionManager.accelerometerAvailable) {
            motionManager.startAccelerometerUpdatesToQueue(NSOperationQueue()) {
                (data, error) in
                let currentX = monkey.position.x
                let currentY = monkey.position.y
                if(data.acceleration.y < -0.25) {  // tilting the device to the right
                    var destX = (CGFloat(data.acceleration.y) * CGFloat(kPlayerSpeed) + CGFloat(currentX))
                    var destY = CGFloat(currentY)
                    motionManager.accelerometerActive == true;
                    let action = SKAction.moveTo(CGPointMake(destX, destY), duration: 1)
                    monkey.runAction(action)
                } else if (data.acceleration.y > 0.25) {  // tilting the device to the left
                    var destX = (CGFloat(data.acceleration.y) * CGFloat(kPlayerSpeed) + CGFloat(currentX))
                    var destY = CGFloat(currentY)
                    motionManager.accelerometerActive == true;
                    let action = SKAction.moveTo(CGPointMake(destX, destY), duration: 1)
                    monkey.runAction(action)
                }
            }
        }
    }
}



