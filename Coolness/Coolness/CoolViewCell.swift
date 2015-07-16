import UIKit


enum Opacity: CGFloat {
    case Normal = 1.0
    case Highlighted = 0.5
    
    var alpha: CGFloat {
        return self.rawValue
    }
}

let DefaultPadding = CGFloat(12.0)

class CoolViewCell: UIView
{
    var text: NSString = "Default Text"
    
    var textAttributes: [NSObject : AnyObject] = [
        NSFontAttributeName : UIFont.boldSystemFontOfSize(18.0),
        NSForegroundColorAttributeName: UIColor.whiteColor(),
    ]
    
    var highlighted: Bool = false {
        willSet {
            self.alpha = (newValue ? Opacity.Highlighted.alpha : Opacity.Normal.alpha)
        }
    }
    
    func configureLayer()
    {
        self.layer.borderWidth = 2.0
        self.layer.borderColor = UIColor.whiteColor().CGColor
        self.layer.cornerRadius = 10.0
        
        self.layer.masksToBounds = true
    }

    override init(frame: CGRect)
    {
        super.init(frame: frame)
        configureLayer()
    }
    
    required init(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        configureLayer()
    }
}


// MARK: UIView Drawing
extension CoolViewCell
{
    override func drawRect(rect: CGRect)
    {
        text.drawAtPoint(
            CGPoint(x: DefaultPadding, y: DefaultPadding),
            withAttributes: textAttributes)
    }
}


// MARK: UIView Geometry
extension CoolViewCell
{
    override func sizeThatFits(size: CGSize) -> CGSize
    {
        var newSize = text.sizeWithAttributes(textAttributes)
        newSize.width += 2 * DefaultPadding
        newSize.height += 2 * DefaultPadding
        return newSize
    }
}

// MARK: UIResponder Methods
extension CoolViewCell
{
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        self.highlighted = true
        self.superview?.bringSubviewToFront(self)
    }
    
    override func touchesMoved(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        let touch: UITouch = touches.first as! UITouch
        let currLocation = touch.locationInView(touch.view)
        let prevLocation = touch.previousLocationInView(touch.view)
        
        touch.view.frame = touch.view.frame.rectByOffsetting(
            dx: currLocation.x - prevLocation.x,
            dy: currLocation.y - prevLocation.y)
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent)
    {
        self.highlighted = false
    }
    
    override func touchesCancelled(touches: Set<NSObject>!, withEvent event: UIEvent!)
    {
        self.highlighted = false
    }
}
