import Foundation

class ToDoItem{

    var itemName = ""
    var completed = false
    var creationDate = NSDate()
    
    init(name:String){
        self.itemName = name
    }

}
