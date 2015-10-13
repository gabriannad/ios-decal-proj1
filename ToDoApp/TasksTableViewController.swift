//
//  TasksTableViewController.swift
//  ToDoApp
//
//  Created by Gabrianna Dumaguin on 10/9/15.
//  Copyright © 2015 Gabrianna Dumaguin. All rights reserved.
//

import UIKit

protocol NewTaskDelegate {
    func sendBack(str: String)
    func updateModel(strs: [String])
}

class TasksTableViewController: UITableViewController, NewTaskDelegate {
    var model : [String]!
    var taskList : [Task] = []
    
    @IBAction func unwindToTasksTableViewController(segue: UIStoryboardSegue) {
        let source: AddTaskViewController = segue.sourceViewController as! AddTaskViewController
        if let item = source.taskItem {
            self.taskList.append(item)
            self.tableView.reloadData()
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        model = [String]()
    }
    
    override func viewWillAppear(animated: Bool) {
        removeExpiredTasks()
        super.viewWillAppear(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    func sendBack(str: String) {
        print(str)
    }
    
    func updateModel(strs: [String]) {
        model.appendContentsOf(strs)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let nav = segue.destinationViewController as! UINavigationController
        let vc = nav.viewControllers.first as! AddTaskViewController
        vc.delegate = self
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.taskList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell")
        let taskItem: Task = self.taskList[indexPath.row]
        cell!.textLabel!.text = taskItem.taskDescription
        let model = (self.tabBarController as! TabBarController).model
        if taskItem.completed {
            cell!.accessoryType = .Checkmark
            taskItem.timeCompleted = NSDate()
            if !model.completedTasks.contains(taskItem) {
                model.completedTasks.append(taskItem)
            }
        }
        else {
            cell!.accessoryType = .None
            model.completedTasks = model.completedTasks.filter() {$0 != taskItem}
        }
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: false)
        let tappedItem: Task = self.taskList[indexPath.row] as Task
        tappedItem.completed = !tappedItem.completed
        tableView.reloadData()
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        tableView.beginUpdates()
        tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        taskList.removeAtIndex(indexPath.row)
        tableView.endUpdates()
    }
    
    func removeExpiredTasks() {
        var expiredTasks : [Task] = []
        for task in taskList {
            if task.timeCompleted?.timeIntervalSinceNow >= 86400 {
                expiredTasks.append(task)
            }
        }
        taskList = taskList.filter {value in !expiredTasks.contains(value)}
    }

}
