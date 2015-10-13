//
//  SecondViewController.swift
//  ToDoApp
//
//  Created by Gabrianna Dumaguin on 10/7/15.
//  Copyright © 2015 Gabrianna Dumaguin. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    @IBOutlet weak var tasksCompleted: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        let model = (self.tabBarController as! TabBarController).model
        
        tasksCompleted.text = String(model.completedTasks.count)
    }

}

