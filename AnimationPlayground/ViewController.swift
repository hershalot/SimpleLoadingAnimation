//
//  ViewController.swift
//  AnimationPlayground
//
//  Created by Justin Hershey on 10/7/17.
//  Copyright © 2017 Justin Hershey. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var animation: SimpleLoadingAnimation!
    var animation2: SimpleSecondaryLoadingAnimation!
    var ballsView: BouncingBallsView!
    var squaresView: SpinningBoxesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        
        let animationFrame: CGRect = CGRect(x: self.view.frame.width/4, y: self.view.frame.height/4, width: 100, height: 100)
        
        squaresView = SpinningBoxesView(frame: animationFrame)
        
        self.view.addSubview(squaresView)
        
        
        
        /**
         *
         * BOUNCING BALLS ANIMATION
         *
         */
        
//        ballsView = BouncingBallsView(frame: animationFrame, numBalls: 4, ballColors: [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.green])
//        ballsView.center = self.view.center
//        self.view.addSubview(ballsView)
//
//        ballsView.startAnimating()
        
        
        

        /**
         *
         * ANIMATION WITH INSIDE/OUTSIDE DEMO
         *
         */
        
        
//        animation images
//        let outsideImage: UIImage = UIImage(named: "logoOutsideRing")!
//        let insideImage: UIImage = UIImage(named: "logoGlassOnly")!
//
//        //secondary animation images
//        let outsideImage2: UIImage = UIImage(named: "outsideRingRoisListIcon")!
//        let insideImage2: UIImage = UIImage(named: "insideHouseRoisListIcon")!
//
//        animation2 = SimpleSecondaryLoadingAnimation(outsideImage: outsideImage2, insideImage: insideImage2)
//        self.view.addSubview(animation2)
//
//
//        animation2.startAnimating()
//
//        //init SimpleLoadingAnimation with images
//        animation = SimpleLoadingAnimation.init(frame: animationFrame, outsideImage:outsideImage, insideImage: insideImage)
//
//        //init with default frame
//        animation = SimpleLoadingAnimation.init(outsideImage:outsideImage, insideImage: insideImage)
////        self.view.addSubview(animation)
//
//        //start animating
//        animation.startAnimating()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func resetAction(_ sender: Any) {

//        self.ballsView.reset()
        
    }
    
    @IBAction func startAction(_ sender: Any) {
//        self.ballsView.startAnimating()
    }
    @IBAction func stopAction(_ sender: Any) {
//        self.ballsView.stopAnimating()
    }
    
}

