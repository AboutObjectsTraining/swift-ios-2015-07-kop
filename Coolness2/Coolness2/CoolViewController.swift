import UIKit

let AccessoryHeight: CGFloat = 66

class CoolViewController: UIViewController
{
    @IBOutlet var textField: UITextField!
    @IBOutlet var coolView: UIView!
    
    @IBAction func addCoolView()
    {
        println("\(textField.text)")
        
        let newCell = CoolViewCell(frame: CGRect.zeroRect)
        newCell.text = textField.text
        newCell.sizeToFit()
        
        coolView.addSubview(newCell)
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
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


extension CoolViewController: UITextFieldDelegate
{
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {
        textField.resignFirstResponder()
        return true
    }
}




