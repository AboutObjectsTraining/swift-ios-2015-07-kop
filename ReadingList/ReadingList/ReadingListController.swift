import UIKit

class ReadingListController: UITableViewController
{
    @IBAction func cancelEditingBook(segue: UIStoryboardSegue)
    {
        
    }
}


// MARK: UIDataSource Protocol Methods
extension ReadingListController
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 100 // FIXME: Replace hardcoded value.
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookSummary") as! UITableViewCell
        
        cell.textLabel?.text = "Row \(indexPath.row + 1)"
        
        return cell
    }
}