import UIKit

class ReadingListController: UITableViewController
{
    let readingListStore = ReadingListStore("BooksAndAuthors")
    var readingList: ReadingList!
    
    override func viewDidLoad()
    {
        readingList = readingListStore.readingList()
        title = readingList.title
    }
    
    @IBAction func cancelEditingBook(segue: UIStoryboardSegue)
    {
        
    }
    
    override func prepareForSegue(
        segue: UIStoryboardSegue,
        sender: AnyObject?)
    {
        if let controller = segue.destinationViewController as? ViewBookController
        {
            let indexPath = tableView.indexPathForSelectedRow()
            let selectedBook = readingList.books[indexPath!.row]
            controller.book = selectedBook
        }
    }
}


// MARK: UIDataSource Protocol Methods
extension ReadingListController
{
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return readingList.books.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier("BookSummary") as! UITableViewCell
        
        let book = readingList.books[indexPath.row]
        
        cell.textLabel?.text = book.title
        cell.detailTextLabel?.text = "\(book.year)  \(book.author!.fullName)"
        cell.imageView?.image = UIImage(named: book.author!.lastName)
        
        return cell
    }
}