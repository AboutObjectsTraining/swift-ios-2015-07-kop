import UIKit

let AccessoryHeight: CGFloat = 66

class CoolViewController: UIViewController
{
    var textField: UITextField!
    var coolView: UIView!
    
    func addCoolView()
    {
        println("\(textField.text)")
        
        let newCell = CoolViewCell(frame: CGRect.zeroRect)
        newCell.text = textField.text
        newCell.sizeToFit()
        
        coolView.addSubview(newCell)
    }
    
    override func loadView()
    {
        let bounds = UIScreen.mainScreen().bounds
        
        let backgroundView = UIView(frame: bounds)
        view = backgroundView
        
        backgroundView.backgroundColor = UIColor.brownColor()
        
        let accessoryView = UIView(frame: CGRect(
            origin: bounds.origin,
            size: CGSize(
                width: bounds.width,
                height: AccessoryHeight)))
        
        backgroundView.addSubview(accessoryView)
        accessoryView.backgroundColor = UIColor(white: 1.0, alpha: 0.5)
        
        coolView = UIView(frame: CGRect(
            x: bounds.origin.x,
            y: AccessoryHeight,
            width: bounds.width,
            height: bounds.height - AccessoryHeight))
        
        backgroundView.addSubview(coolView)
        coolView.backgroundColor = UIColor(white: 1.0, alpha: 0.7)
        
        coolView.clipsToBounds = true
        
//        self.coolView = coolView
        
        // Controls
        
        textField = UITextField(frame: CGRect(x: 8, y: 28, width: 280, height: 30))
        accessoryView.addSubview(textField)
        
        textField.borderStyle = .RoundedRect
        textField.placeholder = "Enter some text"
        
        let button = UIButton.buttonWithType(.System) as! UIButton
        button.setTitle("Add", forState: .Normal)
        button.sizeToFit()
        
        accessoryView.addSubview(button)
        button.frame.offset(dx: 300.0, dy: 28.0)
        
        
        button.addTarget(self, action: Selector("addCoolView"), forControlEvents: .TouchUpInside)
        
        
        // Cool View Cells
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
    }
}
