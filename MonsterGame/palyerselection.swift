//
//  palyerselection.swift
//  Monster
//
//  Created by Parth Patel on 2018-05-31.
//  Copyright © 2018 ParthPatel. All rights reserved.
//
import Foundation
import SpriteKit

class playerselection : SKScene
{var playera = SKSpriteNode()
    var playerb = SKSpriteNode()
    var multiButton = SKSpriteNode()
    let playeraTex = SKTexture(imageNamed: "player1")
    
    let playerbTex = SKTexture(imageNamed: "player2")
    //let multiButtonTex = SKTexture(imageNamed: "multi_logo")
    
    override func didMove(to view: SKView) {
        
       playera = SKSpriteNode(texture:playeraTex)
       playera.position = CGPoint(x: size.width * 0.3, y: self.frame.midY)
       playera.size = CGSize(width: 200, height: 200)
        playerb = SKSpriteNode(texture: playerbTex)
        playerb.position = CGPoint(x: size.width * 0.7, y:    self.frame.midY)
        playerb.size = CGSize(width: 200, height: 200)
        self.addChild(playera)
        self.addChild(playerb)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playera {
                if view != nil
                {
                    let defaults = UserDefaults.standard
                    defaults.set(1, forKey: "user")
                    gamevariable.flagA=1
                    gamevariable.flagB=0

                    defaults.synchronize()
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = speedselection(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
            if node == playerb {
                
                if view != nil
                {
                    let defaults = UserDefaults.standard
                    defaults.set(1, forKey: "user")
                    gamevariable.flagB=1
                    gamevariable.flagA=0

                    defaults.synchronize()
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = speedselection(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
                
                
            }
        }
    }
}


