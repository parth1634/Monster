//
//  GameOverScene.swift
//  Monster
//
//  Created by Parth Patel on 2018-05-31.
//  Copyright © 2018 ParthPatel. All rights reserved.
//

import Foundation
import SpriteKit

class GameOverScene: SKScene {
    
    init(size: CGSize, won:Bool) {
        
        super.init(size: size)
        
        // 1
        backgroundColor = SKColor.white
        var message:String
        var label:SKLabelNode
        
        
        if(gamevariable.flagA==1)
        {
            message = won ? "Player 1 Won! score is: \(gamevariable.count)" : "player 1  Lose! score is :\(gamevariable.count) "
            
            // 3
            label = SKLabelNode(fontNamed: "Menlo-Regular ")
            label.text = message
            label.fontSize = 40
            label.fontColor = SKColor.black
            label.position = CGPoint(x: size.width/2, y: size.height/2)
            addChild(label)
            
            // 4
            run(SKAction.sequence([
                SKAction.wait(forDuration: 3.0),
                SKAction.run() {
                    // 5
                    gamevariable.count=0
                    let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                    let scene = playerselection(size: size)
                    self.view?.presentScene(scene, transition:reveal)
                }
                ]))
            gamevariable.flagA=0
            
        }
        else if(gamevariable.flagB==1)
        {
            message = won ? "Player 2 Won! score is :\(gamevariable.count)" : "player 2  Lose! score is :\(gamevariable.count) "
            
            // 3
            label = SKLabelNode(fontNamed: "Menlo-Regular ")
            label.text = message
            label.fontSize = 40
            label.fontColor = SKColor.black
            label.position = CGPoint(x: size.width/2, y: size.height/2)
            addChild(label)
            
            // 4
            run(SKAction.sequence([
                SKAction.wait(forDuration: 3.0),
                SKAction.run() {
                    // 5
                    gamevariable.count=0
                    let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                    let scene = playerselection(size: size)
                    self.view?.presentScene(scene, transition:reveal)
                }
                ]))
            gamevariable.flagB=0
        }
            
        else{
            // 2
            message = won ? "You Won! score is : \(gamevariable.count)" : "You Lose! score is :\(gamevariable.count) "
            
            // 3
            label = SKLabelNode(fontNamed: "Menlo-Regular ")
            label.text = message
            label.fontSize = 40
            label.fontColor = SKColor.black
            label.position = CGPoint(x: size.width/2, y: size.height/2)
            addChild(label)
            
            // 4
            run(SKAction.sequence([
                SKAction.wait(forDuration: 3.0),
                SKAction.run() {
                    // 5
                    gamevariable.count=0
                    let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
                    let scene = GameScene(size: size)
                    self.view?.presentScene(scene, transition:reveal)
                }
                ]))
            
        }
        
    }
    var single = SKSpriteNode()
    
    let singleTex = SKTexture(imageNamed: "home")
    
    override func didMove(to view: SKView) {
        
        single = SKSpriteNode(texture: singleTex)
        single.position = CGPoint(x: self.frame.midX, y: self.frame.minY+50.0)
        single.size = CGSize(width: 100, height: 100)
        self.addChild(single)
        
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
                    gamevariable.normalspeed=0
                    gamevariable.doublespeed=0
                    defaults.synchronize()
                    let transition:SKTransition = SKTransition.fade(withDuration: 1)
                    let scene:SKScene = startpage(size: self.size)
                    self.view?.presentScene(scene, transition: transition)
                }
            }
        }
    }
    
    
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
