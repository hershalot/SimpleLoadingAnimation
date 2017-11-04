//
//  SimpleSecondaryLoadingAnimation.swift
//  AnimationPlayground
//
//  Created by Justin Hershey on 11/3/17.
//  Copyright © 2017 Justin Hershey. All rights reserved.
//

import UIKit

class SimpleSecondaryLoadingAnimation: UIView {

    
    var hidesWhenStopped = true
    var showsWhenStarted = true
    var gameTimer: Timer!
    var animationInterval: TimeInterval = 1.5
    
    //image views to animate
    var outSideCircleImageView : UIImageView!
    var insideImageView: UIImageView!
    
    //used to determine rotation distance
    var grow: Bool = false
    //used to determine rotation distance
    var rotationScalor: CGFloat = 1.0
    
    
    //init with custom frame and images
    init(frame: CGRect, outsideImage: UIImage, insideImage: UIImage){
        super.init(frame: frame)
        
        //configure subviews
        self.setupImageViews(outsideImage: outsideImage, insideImage: insideImage)
        
    }
    
    //init without setting frame
    init(outsideImage: UIImage, insideImage: UIImage){
        
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        let screenHeight = screenSize.height
        
        //places this view in the center of the screen
        let frame: CGRect = CGRect(x: screenWidth/2 - 25,y: screenHeight/2 - 25, width: 70,height: 70)
        super.init(frame:frame)
        
        //configure subviews
        self.setupImageViews(outsideImage: outsideImage, insideImage: insideImage)
        
    }
    
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //configures and adds imageviews based on the frame given
    func setupImageViews(outsideImage: UIImage, insideImage: UIImage){
        
        //setup outside imageview
        self.outSideCircleImageView = UIImageView.init(frame: self.bounds)
        self.outSideCircleImageView.image = outsideImage
        self.outSideCircleImageView.contentMode = .scaleToFill
        self.addSubview(self.outSideCircleImageView)
        
        //setup inside imageview (Half the size of outside image view)
        self.insideImageView = UIImageView.init(frame: CGRect.zero)
        self.insideImageView.frame.size = CGSize(width: self.outSideCircleImageView.bounds.width * 0.5, height: self.outSideCircleImageView.bounds.height * 0.5)
        self.insideImageView.center = outSideCircleImageView.center
        self.insideImageView.contentMode = .scaleToFill
        self.insideImageView.image = insideImage
        self.addSubview(self.insideImageView)
        
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
        
        //change scale so we get the full rotation effect every two times this is called
        if grow{
            //grow
            grow = false
            UIView.animate(withDuration: self.animationInterval){
                
                //animate imageviews
                self.insideImageView.transform = CGAffineTransform(scaleX: 2.0, y: 2.0)
                self.outSideCircleImageView.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
                self.outSideCircleImageView.transform = CGAffineTransform(rotationAngle: (.pi * self.rotationScalor))
            }
        }else {
            //shrink
            grow = true
            UIView.animate(withDuration: self.animationInterval){
                
                //animate imageviews
                self.insideImageView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
                self.outSideCircleImageView.transform = CGAffineTransform(scaleX: 0.5, y: 1.0)
                self.outSideCircleImageView.transform = CGAffineTransform(rotationAngle: (.pi * self.rotationScalor))
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
