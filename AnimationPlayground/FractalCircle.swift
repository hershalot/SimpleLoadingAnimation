//
//  FractalCircle.swift
//  AnimationPlayground
//
//  Created by Justin Hershey on 11/13/17.
//  Copyright © 2017 Justin Hershey. All rights reserved.
//

import UIKit

class FractalCircle: UIView {
    
    
    var hidesWhenStopped = true
    var showsWhenStarted = true
    var timer: Timer!
    var animationInterval: TimeInterval = 1.0
    
    //circle attributes
    var subCircleDiameter: CGFloat = 0.0
    var numberOfSubCircles: Int = 0
    var depth: Int = 0
    var circleColor: UIColor!
    var originalCenter: CGPoint = CGPoint.zero
    var isParent: Bool = false
    
    
    //init with custom frame, use isParent as true if it is the parent circle that has no parents
    init(frame: CGRect, isParent: Bool){
        
        //frame needs to be a square so the circles are the correct shape
        super.init(frame: frame)
        
        //circle attributes
        self.isParent = isParent

        self.numberOfSubCircles = 4
        self.circleColor = UIColor.blue
        self.subCircleDiameter = self.bounds.width / 4
    }
    
    
    //creates subcircles based on the size of the parent circle, numberOfSubCircles
    func createSubCircles(){
        
        //set the original center the circles will return to
        self.originalCenter = self.center
        
        //create the correct number of subcircles
        for i in 0 ..< numberOfSubCircles {
            
            //use i to determine center?
            let circle: FractalCircle = FractalCircle(frame: CGRect.zero, isParent: false)
            circle.frame.size = CGSize(width: self.bounds.width/subCircleDiameter, height: self.bounds.height/subCircleDiameter)
            circle.clipsToBounds = true
            circle.layer.cornerRadius = self.bounds.width/2
            circle.center = self.center
            circle.tag = i;
            
            self.addSubview(circle)
        }
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
