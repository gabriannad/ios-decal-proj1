//
//  Task.swift
//  ToDoApp
//
//  Created by Gabrianna Dumaguin on 10/9/15.
//  Copyright © 2015 Gabrianna Dumaguin. All rights reserved.
//

import UIKit

class Task: NSObject {
    var taskDescription : String?
    var completed : Bool
    var timeCompleted : NSDate?
    
    init(task: String) {
        self.taskDescription = task
        self.completed = false
        self.timeCompleted = nil
    }
}
