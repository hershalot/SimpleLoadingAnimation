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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        
        //animation images
        let outsideImage: UIImage = UIImage(named: "logoOutsideRing")!
        let insideImage: UIImage = UIImage(named: "logoGlassOnly")!
        
        
        //setup animation frame
        let animationFrame: CGRect = CGRect(x: self.view.frame.width/4, y: self.view.frame.height/4, width: self.view.frame.width/2, height: self.view.frame.width/2)
        
        //init SimpleLoadingAnimation with images
        animation = SimpleLoadingAnimation.init(frame: animationFrame, outsideImage:outsideImage, insideImage: insideImage)
        
        
        
        //init with default frame
        animation = SimpleLoadingAnimation.init(outsideImage:outsideImage, insideImage: insideImage)
        
        self.view.addSubview(animation)
        
        //start animating
        animation.startAnimating()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func resetAction(_ sender: Any) {
        
        self.animation.stopAnimating()
        self.animation.startAnimating()
        
    }
}

