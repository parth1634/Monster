//
//  playerpage.swift
//  Monster
//
//  Created by Parth Patel on 2018-05-31.
//  Copyright © 2018 ParthPatel. All rights reserved.
//

import Foundation
import SpriteKit

class playerpage : SKScene
{
    var single = SKSpriteNode()
    var double = SKSpriteNode()
    var multiButton = SKSpriteNode()
    let singleTex = SKTexture(imageNamed: "single")
    
    let doubleTex = SKTexture(imageNamed: "double")
    //let multiButtonTex = SKTexture(imageNamed: "multi_logo")
    
    override func didMove(to view: SKView) {
        
        single = SKSpriteNode(texture: singleTex)
        single.position = CGPoint(x: size.width * 0.3, y: self.frame.midY)
        single.size = CGSize(width: 200, height: 200)
        double = SKSpriteNode(texture: doubleTex)
        double.position = CGPoint(x: size.width * 0.7, y:    self.frame.midY)
        double.size = CGSize(width: 200, height: 200)
        self.addChild(single)
        self.addChild(double)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == single {
                if view != nil
                {
                    let defaults = UserDefaults.standard
                    defaults.set(1, forKey: "user")
                    
                    defaults.synchronize()
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = speedselection(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
            if node == double {
                
                if view != nil
                {
                    let defaults = UserDefaults.standard
                    defaults.set(1, forKey: "user")
                    
                    defaults.synchronize()
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = playerselection(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }

                
            }
        }
    }
}


