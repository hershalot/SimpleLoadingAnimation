//
//  HrGlassLoadingAnimation.swift
//  AnimationPlayground
//
//  Created by Justin Hershey on 11/1/17.
//  Copyright © 2017 Justin Hershey. All rights reserved.
//
//
//
// Animates a rotating image within a border image. The outside border image is translated based on the current period to add a little flavor

import UIKit

class SimpleLoadingAnimation: UIView {
    
    
    
    var hidesWhenStopped = true
    var showsWhenStarted = true
    var gameTimer: Timer!
    var animationInterval: TimeInterval = 1.0
    
    //image views to animate
    var outSideCircleImageView : UIImageView!
    var insideImageView: UIImageView!
    
    //used to determine rotation distance
    var rotationScalor: CGFloat = 2.0
    
    //start at
    var translatePeriod: Int = 4

    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        //setup outside imageview
        self.outSideCircleImageView = UIImageView.init(frame: self.bounds)
        self.outSideCircleImageView.image = UIImage(named: "logoOutsideRing")
        self.outSideCircleImageView.contentMode = .scaleToFill
        self.addSubview(self.outSideCircleImageView)
        
        //setup inside imageview (Half the size of outside image view)
        self.insideImageView = UIImageView.init(frame: CGRect.zero)
        self.insideImageView.frame.size = CGSize(width: self.outSideCircleImageView.bounds.width * 0.5, height: self.outSideCircleImageView.bounds.height * 0.5)
        self.insideImageView.center = outSideCircleImageView.center
        self.insideImageView.contentMode = .scaleToFill
        self.insideImageView.image = UIImage(named: "logoGlassOnly")
        self.addSubview(self.insideImageView)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func timerStart(){
        //timer fired slightly quicker than the animation period for a smoother transition
       gameTimer = Timer.scheduledTimer(timeInterval: animationInterval - (animationInterval * 0.1), target: self, selector: #selector(timerAnimate), userInfo: nil, repeats: true)
        
    }
    
    
    
    func timerAnimate(){
        
        //change scale so we get the full rotation effect every two times this is called
        if rotationScalor == 1.0{
            self.rotationScalor = 2.0
        }else if self.rotationScalor == 2.0{
            self.rotationScalor = 1.0
        }

        
        UIView.animate(withDuration: self.animationInterval){
            
            //animate imageviews
            self.outSideCircleImageView.transform = CGAffineTransform(rotationAngle: (.pi * self.rotationScalor))
            self.insideImageView.transform = CGAffineTransform(rotationAngle:(.pi * self.rotationScalor))
            
            //change translation of outside ring based on period (4 periods)
            if self.translatePeriod == 1{
                print("period 1")
                self.translatePeriod = 2
                self.outSideCircleImageView.transform = CGAffineTransform(translationX: self.insideImageView.frame.width/4, y: 0)
                
            }else if self.translatePeriod == 2{
                print("period 2")
                self.translatePeriod = 3
                self.outSideCircleImageView.transform = CGAffineTransform(translationX: 0, y: self.insideImageView.frame.height/4)
                
            }else if self.translatePeriod == 3{
                print("period 3")
                self.translatePeriod = 4
                self.outSideCircleImageView.transform = CGAffineTransform(translationX: -self.insideImageView.frame.width/4, y: 0)
                
            }else if self.translatePeriod == 4{
                print("period 4")
                self.translatePeriod = 1
                self.outSideCircleImageView.transform = CGAffineTransform(translationX: 0, y: -self.insideImageView.frame.height/4)
                
            }
        }
    }
    
    
    //starts gameTimer and unhides view if showsWhenStarted is true
    func startAnimating(){
        
        self.timerStart()
        
        if self.showsWhenStarted{
            self.isHidden = false
        }
    }
    
    
    
    //invalidates gameTimer and will hide if hidesWhenStopped is true
    func stopAnimating(){
        
        gameTimer.invalidate()
        
        if self.hidesWhenStopped{
            self.isHidden = true
        }
    }
    
    
    

}
