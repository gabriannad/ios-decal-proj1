//
//  AddTaskViewController.swift
//  ToDoApp
//
//  Created by Gabrianna Dumaguin on 10/9/15.
//  Copyright © 2015 Gabrianna Dumaguin. All rights reserved.
//

import UIKit

class AddTaskViewController: UIViewController {
    var delegate : NewTaskDelegate?
    var taskItem : Task?

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var doneButton: UIBarButtonItem!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if sender as? NSObject != self.doneButton {
            return
        }
        if self.textField.text!.characters.count > 0 {
            self.taskItem = Task(task: self.textField.text!)
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
