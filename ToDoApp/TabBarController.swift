//
//  TabBarController.swift
//  ToDoApp
//
//  Created by Gabrianna Dumaguin on 10/12/15.
//  Copyright © 2015 Gabrianna Dumaguin. All rights reserved.
//

import UIKit

class ModelData {
    var completedTasks : [Task] = []
}

class TabBarController: UITabBarController {
    
    var model = ModelData()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(animated: Bool) {
        removeExpiredTasks()
        super.viewWillAppear(false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func removeExpiredTasks() {
        var expiredTasks : [Task] = []
        for task in model.completedTasks {
            if task.timeCompleted?.timeIntervalSinceNow >= 86400 {
                expiredTasks.append(task)
            }
        }
        model.completedTasks = model.completedTasks.filter {value in !expiredTasks.contains(value)}
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
