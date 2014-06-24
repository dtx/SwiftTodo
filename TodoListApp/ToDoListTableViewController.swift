import UIKit

@objc(ToDoListTableViewController) class ToDoListTableViewController: UITableViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet
    var tableViewlocal: UITableView
    
    @IBAction func unwindToList(segue:UIStoryboardSegue){
        var source: AddToDoViewController = segue.sourceViewController as AddToDoViewController
        if var item: ToDoItem = source.toDoItem{
            self.toDoItems.addObject(item)
            self.tableView.reloadData()
        }
        
    }
    
    
    var toDoItems: NSMutableArray = []
    var cellReuseIdentifier = "cell"
   
    
    override func viewDidLoad(){
        super.viewDidLoad()
        loadInitialData()
        self.tableViewlocal.registerClass(UITableViewCell.self, forCellReuseIdentifier: self.cellReuseIdentifier)
    }
    
    func loadInitialData(){
        var item1 = ToDoItem(name:"Shop milk")
        self.toDoItems.addObject(item1)
        var item2 = ToDoItem(name: "Shop Egg")
        self.toDoItems.addObject(item2)
        var item3 = ToDoItem(name: "Shop Beer")
        self.toDoItems.addObject(item3)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView!) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView!, numberOfRowsInSection section: Int) -> Int {
        return self.toDoItems.count
    }
    
    override func tableView(tableView: UITableView!, cellForRowAtIndexPath indexPath: NSIndexPath!) -> UITableViewCell! {

        var cell : UITableViewCell = tableView.dequeueReusableCellWithIdentifier(self.cellReuseIdentifier) as UITableViewCell
        var todoitem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as ToDoItem  
        cell.textLabel.text = todoitem.itemName
        if todoitem.completed{
            cell.accessoryType = .Checkmark
        }
        else{
            cell.accessoryType = .None
        }
        
        return cell
    }
    
    override func tableView(tableView: UITableView!, didSelectRowAtIndexPath indexPath: NSIndexPath!) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        var tappedItem: ToDoItem = self.toDoItems.objectAtIndex(indexPath.row) as ToDoItem
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
        
    }
}









