//
//  ViewController.swift
//  JBImageViewTransition
//
//  Created by Jithin B on 30/12/16.
//  Copyright © 2016 com.jb.works. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageTransitionView: JBTransitionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //***** Configure image transition animation *****//
        imageTransitionView.setAnimationImages(NSArray(objects: "image1.jpg","image2.jpg","image3.jpg","image4.jpg"))
        imageTransitionView.animationFromAllSide = true
        imageTransitionView.animationDuration = 3
        imageTransitionView.startJNImageAnimation()
    }
    
    
    @IBAction func stopAnimationButtonTapAction(sender: AnyObject) {
        imageTransitionView.stopJNImageAnimation()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

