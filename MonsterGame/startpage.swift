//
//  startpage.swift
//  Monster
//
//  Created by Parth Patel on 2018-05-31.
//  Copyright © 2018 ParthPatel. All rights reserved.
//

import Foundation
import SpriteKit

class startpage : SKScene
{var playButton = SKSpriteNode()
    var scoreButton = SKSpriteNode()
    var multiButton = SKSpriteNode()
    let playButtonTex = SKTexture(imageNamed: "start")
    
   // let scoreButtonTex = SKTexture(imageNamed: "Score_logo")
    //let multiButtonTex = SKTexture(imageNamed: "multi_logo")
    
    override func didMove(to view: SKView) {
        
        playButton = SKSpriteNode(texture: playButtonTex)
        playButton.position = CGPoint(x:  frame.midX, y: frame.midY)
        playButton.size = CGSize(width: 200, height: 200)
       
        self.addChild(playButton)
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first {
            let pos = touch.location(in: self)
            let node = self.atPoint(pos)
            
            if node == playButton {
                if view != nil
                {
                    let defaults = UserDefaults.standard
                    defaults.set(1, forKey: "user")
                    
                    defaults.synchronize()
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = playerpage(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
           
        }
    }
    }
  

