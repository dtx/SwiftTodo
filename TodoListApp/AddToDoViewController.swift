import UIKit

class AddToDoViewController: UIViewController {
    
    var toDoItem: ToDoItem?

    @IBOutlet var textfield : UITextField


    @IBOutlet var doneButton : UIBarButtonItem
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        if sender as? NSObject != self.doneButton{
            return
        }
        if self.textfield.text.utf16count > 0{
            self.toDoItem = ToDoItem(name: self.textfield.text)
        }
    }
    
    override func touchesBegan(touches: NSSet!, withEvent event: UIEvent!) {
        self.view.endEditing(true)
    }

}

