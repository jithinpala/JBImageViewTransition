<p align="center" >
    <img src="/JBImageViewTransition/Screen shot/transition.gif" title="Title image" float=center width=300>
</p>

## Description


**JBImageViewTransition** is for ios on Swift. It's an awesome utility for UIImage transition


## Installation

### CocoaPods

**JBImageViewTransition** is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'JBImageViewTransition'
```


## Usage

**Using Storyboard / Interface Builder**
* Drag a UIView to Storyboard or Interface Builder, change its class to **JBTransitionView**
* Create IBOutlet for **JBTransitionView**

```Swift
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
    
```

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate JBImageViewTransition into your project manually.
Drag the JBTransitionView.swift from source folder.


### Attributes you can set

```swift
    // This variable is used for animation duration
    var animationDuration           : NSTimeInterval = 2
    // This variable is used for animation direction
    var animationDirection          : AnimationDirection = AnimationDirection.LeftToRight
    // This variable is used for setting animation images
    var animationImageArray         : NSMutableArray = NSMutableArray()
    // This variable is used for animation from all direction and variable type is Bool
    var animationFromAllSide        : Bool = false

```

## Author

[Jithin B](https://www.linkedin.com/in/jithin-b-124506125) made this with ❤️. 


## License

**JBImageViewTransition** is available under the MIT license. See the [LICENSE](https://github.com/jithinpala/JBImageViewTransition/blob/master/LICENSE.md) file for more info.
