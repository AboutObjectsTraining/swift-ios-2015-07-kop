import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(
        application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool
    {
        let bounds = UIScreen.mainScreen().bounds
        window = UIWindow(frame: bounds)
        window?.backgroundColor = UIColor.lightGrayColor()
        
        let backgroundView = UIView(frame: bounds)
        window?.addSubview(backgroundView)
        backgroundView.backgroundColor = UIColor.brownColor()
        
        let coolView = UIView(frame: bounds.rectByInsetting(dx: 5.0, dy: 5.0))
        backgroundView.addSubview(coolView)
        coolView.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        
        let cell1 = CoolViewCell(frame: CGRect(x: 20, y: 40, width: 80, height: 30))
        coolView.addSubview(cell1)
        cell1.backgroundColor = UIColor.purpleColor()
        
        let cell2 = CoolViewCell(frame: CGRect(x: 60, y: 100, width: 80, height: 30))
        coolView.addSubview(cell2)
        cell2.backgroundColor = UIColor.orangeColor()
        
        cell1.text = "The race is to the Swift?"
        cell2.text = "Hello World!"
        
        cell1.sizeToFit()
        cell2.sizeToFit()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}
