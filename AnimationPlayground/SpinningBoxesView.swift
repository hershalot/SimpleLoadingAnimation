//
//  SpinningBoxesView.swift
//  AnimationPlayground
//
//  Created by Justin Hershey on 11/26/17.
//  Copyright © 2017 Justin Hershey. All rights reserved.
//

import UIKit

class SpinningBoxesView: UIView, UICollisionBehaviorDelegate {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    var insideBox: UIView!
    var outsideBox: UIView!
    
    var gravity: UIGravityBehavior!
    var animator: UIDynamicAnimator!
    var collision: UICollisionBehavior!
    var insideBehaviour: UIDynamicItemBehavior!
    var outsideBehaviour: UIDynamicItemBehavior!
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        
        outsideBox = UIView(frame: self.bounds)
        
        self.addSubview(outsideBox)
        
        let insideBoxDiameter = self.bounds.width/2
        
        
        insideBox = UIView(frame: CGRect(x: self.bounds.midX - insideBoxDiameter / 2, y: self.bounds.midY - insideBoxDiameter / 2, width: insideBoxDiameter, height: insideBoxDiameter))
        
        insideBox.backgroundColor = UIColor.blue
        insideBox.layer.cornerRadius = insideBoxDiameter / 2
        outsideBox.backgroundColor = UIColor.orange
        self.addSubview(insideBox)
        
        
        
        //init animator
        animator = UIDynamicAnimator(referenceView: self)
        
        self.setupBehaviors()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setupBehaviors(){
        
        //setup animator behavior
        
        gravity = UIGravityBehavior(items: [insideBox])
        gravity.magnitude = 0.5
        
        collision = UICollisionBehavior(items: [insideBox])
        collision.translatesReferenceBoundsIntoBoundary = true
        collision.collisionDelegate = self

        outsideBehaviour = UIDynamicItemBehavior(items: [outsideBox])
        outsideBehaviour.allowsRotation = true
        outsideBehaviour.angularResistance = 0.0
        outsideBehaviour.addAngularVelocity(2.0, for:outsideBox)
        outsideBehaviour.friction = 0.0
        
        insideBehaviour = UIDynamicItemBehavior(items: [insideBox])
        insideBehaviour.allowsRotation = true
        insideBehaviour.elasticity = 1.0
        insideBehaviour.friction = 0.0
        
        self.animator.addBehavior(gravity)
        self.animator.addBehavior(collision)
        self.animator.addBehavior(outsideBehaviour)
        self.animator.addBehavior(insideBehaviour)

        
    }
}
