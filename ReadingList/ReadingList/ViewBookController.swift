import UIKit

class ViewBookController: UITableViewController
{
    var book: Book!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var lastNameLabel: UILabel!
    
    override func viewWillAppear(animated: Bool)
    {
        super.viewWillAppear(animated)
        
        titleLabel.text = book.title
        yearLabel.text = book.year
        
        if let firstName = book.author?.firstName {
            firstNameLabel.text = firstName
        }
        
        if let lastName = book.author?.lastName {
            lastNameLabel.text = lastName
        }
    }
}
