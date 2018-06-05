//
//  KGPlayerShipNode.swift
//  Monster/Users/Dixitapatel/Documents/Monster/Monster
//
//  Created by Parth Patel on 2018-05-31.
//  Copyright © 2018 ParthPatel. All rights reserved.
//

import SpriteKit

class KGPlayerShipNode: SKSpriteNode {
    
    var touchPoint: UITouch?
    var lastInterval: CFTimeInterval?
    var travelling: Bool
    let brakeDistance:CGFloat = 4.0
    let defaultShipSpeed = 250;
         let defaultScale:CGFloat = 0.5
    let defaultTextureName = "player"
    let defaultSize:CGSize = CGSize(width: 200.0, height: 53.0)
    
    init(imageNamed name: String)
    {
         let texture = SKTexture(imageNamed: defaultTextureName)
        let color = UIColor.red
        let size = defaultSize
        
       // let spaceship = SKSpriteNode(imageNamed: "Player")
        
        travelling = false
        
        super.init(texture: texture, color: color, size: size)
        
        loadDefaultParams()

    }
    
//    init() {
//        
//        //let texture = SKTexture(imageNamed: defaultTextureName)
//        let texture=SKTexture(imageNamed:"Player")
//        let color = UIColor.red
//        let size = defaultSize
//      
//         let spaceship = SKSpriteNode(imageNamed: "Player")
//      
//        travelling = false
//        
//        super.init(texture: texture, color: color, size: size)
//        
//        loadDefaultParams()
//    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func loadDefaultParams() {
        self.xScale = defaultScale
        self.yScale = defaultScale
    }
    
    func travelTowardsPoint(_ point: CGPoint, byTimeDelta timeDelta: TimeInterval) {
        let shipSpeed = defaultShipSpeed
        
        let distanceLeft = sqrt(pow(position.x - point.x, 2) + pow(position.y - point.y, 2))
        
        if (distanceLeft > brakeDistance) {
            let distanceToTravel = CGFloat(timeDelta) * CGFloat(shipSpeed)
            let angle = atan2(point.y - position.y, point.x - position.x)
            let yOffset = distanceToTravel * sin(angle)
            let xOffset = distanceToTravel * cos(angle)
            
            position = CGPoint(x: position.x + xOffset, y: position.y + yOffset)
        }
    }
    
    func update(_ interval: CFTimeInterval) {
        
        if lastInterval == nil {
            lastInterval = interval
        }
        
        let delta: CFTimeInterval = interval - lastInterval!
        
        if (travelling) {
            if let destination = touchPoint?.location(in: (scene as? GameScene)!) {
                            travelTowardsPoint(destination, byTimeDelta: delta)
                         }

        }
        lastInterval = interval
    }
    
}
