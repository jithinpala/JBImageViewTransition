//
//  JBTransitionView.swift
//  JBImageViewTransition
//
//  Created by Jithin B on 30/12/16.
//  Copyright © 2016 com.jb.works. All rights reserved.
//

import UIKit

/**
    JBTransition animation direction
 
    case LeftToRight
    case RightToLeft
    case TopToBottom
    case BottomToTop
 
*/
public enum AnimationDirection {
    /// Animation start from left to right
    case LeftToRight
    /// Animation start from right to left
    case RightToLeft
    /// Animation start from top to bottom
    case TopToBottom
    /// Animation start from bottom to top
    case BottomToTop
}

class JBTransitionView: UIView {
    
    private var maskImageLayer      : CAGradientLayer! = nil
    private var imageLayer          : CALayer! = nil
    private var fromImageLayer      : CALayer! = nil
    private var imageGroupLayer     : CALayer! = nil
    private var currentImage        : UIImage! = nil
    private var fromImage           : UIImage! = nil
    private var imageIndex          : Int = 0
    private var stopAnimationBool   : Bool = false
    
    /// This variable is used for **animation duration** and variable type is *NSTimeInterval*
    var animationDuration           : NSTimeInterval = 2
    /// This variable is used for **animation direction**
    var animationDirection          : AnimationDirection = AnimationDirection.LeftToRight
    /// This variable is used for setting animation images
    var animationImageArray         : NSMutableArray = NSMutableArray()
    /// This variable is used for animation from all direction and variable type is *Bool*
    var animationFromAllSide        : Bool = false
    

    /**
        Initialize the view programmatically
     
        - Parameter frame: CGRect
    */
    override init(frame: CGRect) {
        super.init(frame: frame)
        if frame == CGRectZero {
            fatalError("Can't continue with CGRectZero")
        }
        self.initializeView()
    }
    
    /**
        Initialize the view from storyboard
     
        - Parameter aDecoder: NSCoder
     */
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initializeView()
    }
    
    /**
        Private method to initialize all views
     */
    private func initializeView() {
        
        self.loadUserInterface()
        self.linkUserInterface()
        self.layoutUserInterface()
    }
    
    //MARK: Load user interface
    
    /**
        Private method to load graphic user interface
     */
    private func loadUserInterface() {
        
        self.backgroundColor = UIColor.clearColor()
        self.loadAllImageLayers()
    }
    
    /**
        Private method to load all image layers for animation
     */
    private func loadAllImageLayers() {
        
        imageGroupLayer     =   CALayer()
        fromImageLayer      =   CALayer()
        imageLayer          =   CALayer()
        maskImageLayer      =   CAGradientLayer()
        
        imageGroupLayer.addSublayer(fromImageLayer)
        imageGroupLayer.addSublayer(imageLayer)
        
        switch animationDirection {
        case .LeftToRight:
            maskImageLayer.startPoint = CGPointMake(0, 0.5)
            maskImageLayer.endPoint   = CGPointMake(1, 0.5)
            break
        case .RightToLeft:
            maskImageLayer.startPoint = CGPointMake(1, 0.5)
            maskImageLayer.endPoint   = CGPointMake(0, 0.5)
            break
        case .TopToBottom:
            maskImageLayer.startPoint = CGPointMake(0.5, 0)
            maskImageLayer.endPoint   = CGPointMake(0.5, 1)
            break
        case .BottomToTop:
            maskImageLayer.startPoint = CGPointMake(0.5, 1)
            maskImageLayer.endPoint   = CGPointMake(0.5, 0)
            break
        }
        imageLayer.mask = maskImageLayer
        self.layer.addSublayer(imageGroupLayer)
        
    }
    
    //MARK: Link user interface

    /**
        Private method to bind all layers to its super class
     */
    private func linkUserInterface() {
        
        self.linkFromImage()
        self.linkImage()
        self.linkMaskLayer()
    }
    
    private func linkFromImage() {
        if fromImage != nil {
            fromImageLayer.contents = fromImage.CGImage
        }
        
    }
    
    private func linkImage() {
        if currentImage != nil {
            imageLayer.contents = currentImage.CGImage
        }
    }
    
    private func linkMaskLayer() {
        maskImageLayer.colors = self.getGradientColorsScheme() as [AnyObject]
    }
    
    //MARK: Layout user interface
    
    /**
        Private method to set frame size for all layers
     */
    private func layoutUserInterface() {
        
        imageGroupLayer.frame = self.bounds
        fromImageLayer.frame  = self.bounds
        imageLayer.frame      = self.bounds
        
        switch animationDirection {
            
            case .LeftToRight:
                maskImageLayer.frame = CGRectMake(-2*self.frame.size.width, 0, 2*self.frame.size.width, self.frame.size.height)
                break;
            case .RightToLeft:
                maskImageLayer.frame = CGRectMake(self.frame.size.width, 0, 2*self.frame.size.width, self.frame.size.height)
                break;
            case .TopToBottom:
                maskImageLayer.frame = CGRectMake(0, -2*self.frame.size.height, self.frame.size.width, 2*self.frame.size.height)
                break;
            case .BottomToTop:
                maskImageLayer.frame = CGRectMake(0, self.frame.size.height, self.frame.size.width, 2*self.frame.size.height)
                break;
        }
        
    }
    
    private func showImageOnly() {
        
        self.freeMaskLayer()
        self.freeFromImageLayer()
        self.linkUserInterface()
        self.layoutUserInterface()
        
    }
    
    //MARK: User setter method
    
    /**
        Private method to create gradient color pattern for animation
     */
    private func getGradientColorsScheme() -> NSArray {
        
        return  NSArray(objects: UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 1).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.99).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.95).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.9).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.8).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.7).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.6).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.5).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.4).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.3).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.2).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.1).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.05).CGColor,
        UIColor(hex: 0xffffff, alpha: 0.01).CGColor)
    }
    
    /**
        Set all images for animation
     
        - Parameter imageArray: NSArray
     */
    internal func setAnimationImages(imageArray: NSArray) {
        if imageArray.count > 0 {
            animationImageArray = NSMutableArray(array: imageArray)
        }
    }
    
    /**
        Start the JBImageView animation
     */
    internal func startJNImageAnimation() {
        let imageCount = animationImageArray.count
        let animationDelay: CGFloat = CGFloat(animationDuration)
        if imageCount > 1 {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(UInt64(animationDelay) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
                self.jbImageAnimationStart()
            }
        } else if imageCount > 0 {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(UInt64(animationDelay) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
                self.setAnimationDirection(.BottomToTop)
                self.setImage(UIImage(named: self.animationImageArray.objectAtIndex(0) as! String))
            }
            
        }
    }
    
    /**
        Set animation direction for images
     
        - Parameter direction: AnimationDirection
     */
    internal func setAnimationDirection(direction: AnimationDirection) {
        animationDirection = direction
    }
    
    /**
        Stop the JBImageView animation
     */
    internal func stopJNImageAnimation() {
        stopAnimationBool = true
    }
    
    private func jbImageAnimationStart() {
        
        if stopAnimationBool {
            return
        }        
        if imageIndex >= animationImageArray.count {
            imageIndex = 0
        }
        let animationDelay: CGFloat = CGFloat(animationDuration)
        self.setAnimationDirection(animationFromAllSide ? self.getJBImageAnimationDirection(imageIndex) : animationDirection)
        self.setImage(UIImage(named: self.animationImageArray.objectAtIndex(imageIndex) as! String))
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(UInt64(animationDelay) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (Int64)(UInt64(animationDelay) * NSEC_PER_SEC)), dispatch_get_main_queue()) {
                self.imageIndex += 1
                self.jbImageAnimationStart()
            }
        }
    }
    
    private func getJBImageAnimationDirection(imagePosition: Int) -> AnimationDirection {
        var direction: AnimationDirection
        switch imagePosition {
        case 0:
            direction = .TopToBottom
            break
        case 1:
            direction = .BottomToTop
            break
        case 2:
            direction = .LeftToRight
            break
        case 3:
            direction = .RightToLeft
            break
        default:
            direction = .TopToBottom
            break
        }
        return direction
    }
    
    
    
    private func setImage(image: UIImage?) {
        
        self.clearAllMaskLayers()
        if image != nil {
            self.loadAllImageLayers()
            if currentImage != nil {
                fromImage = UIImage(CGImage: currentImage.CGImage!)
                currentImage = image
                self.linkFromImage()
                self.linkImage()
                self.linkMaskLayer()
                self.layoutUserInterface()
                
                self.startTransitionAnimation()
            } else {
                currentImage = image
                self.showImageOnly()
                
            }
        }
    }
    
    
    
    //MARK: Start transition animation
    
    private func startTransitionAnimation() {
        
        let currentPosition = maskImageLayer.valueForKey("position")?.CGPointValue()
        var newPosition: CGPoint
        switch animationDirection {            
        case .LeftToRight:
            newPosition = CGPointMake((currentPosition?.x)! + maskImageLayer.frame.size.width, (currentPosition?.y)!)
            break;
        case .RightToLeft:
            newPosition = CGPointMake((currentPosition?.x)! - maskImageLayer.frame.size.width, (currentPosition?.y)!)
            break;
        case .TopToBottom:
            newPosition = CGPointMake((currentPosition?.x)!, (currentPosition?.y)! + maskImageLayer.frame.size.height )
            break;
        case .BottomToTop:
            newPosition = CGPointMake((currentPosition?.x)!, (currentPosition?.y)! - maskImageLayer.frame.size.height)
            break;
        }
        
        let imageAnimation = CABasicAnimation(keyPath: "position")
        imageAnimation.delegate = self
        imageAnimation.fromValue = maskImageLayer.valueForKey("position")
        imageAnimation.toValue   = NSValue(CGPoint: newPosition)
        imageAnimation.duration  = animationDuration
        imageAnimation.repeatCount = 1
        imageAnimation.removedOnCompletion = false
        imageAnimation.fillMode = kCAFillModeForwards
        imageAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        imageAnimation.setValue("position", forKey: "animationType")
        maskImageLayer.position = newPosition
        maskImageLayer.addAnimation(imageAnimation, forKey: "position")
        
        
    }
    
    // MARK: Mask clear methods
    
    private func clearAllMaskLayers() {
        self.freeMaskLayer()
        self.freeImageLayer()
        self.freeFromImageLayer()
        self.freeComboLayer()
    }
    
    private func freeMaskLayer() {
        maskImageLayer.removeAllAnimations()
        maskImageLayer.removeFromSuperlayer()
    }
    
    private func freeImageLayer() {
        imageLayer.removeFromSuperlayer()
    }
    
    private func freeFromImageLayer() {
        fromImageLayer.removeFromSuperlayer()
    }
    
    private func freeComboLayer() {
        imageGroupLayer.removeFromSuperlayer()
        imageGroupLayer = nil
    }
    
    
    
}

extension UIColor {
    convenience init(hex: Int, alpha: CGFloat) {
        let components = (
            R: CGFloat((hex >> 16) & 0xff) / 255,
            G: CGFloat((hex >> 08) & 0xff) / 255,
            B: CGFloat((hex >> 00) & 0xff) / 255
        )
        self.init(red: components.R, green: components.G, blue: components.B, alpha: alpha)        
    }
}
