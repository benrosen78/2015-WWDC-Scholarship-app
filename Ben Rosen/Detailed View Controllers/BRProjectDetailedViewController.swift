//
//  BRProjectDetailedViewController.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

let cellIdentifier = "UserDetail.Header"
let closeIdentifier = "UserDetail.Close"

class BRProjectDetailedViewController: UITableViewController {

    var project = BRProject()
    
    init(project: BRProject!) {
        super.init(style: UITableViewStyle.Grouped)
        
        self.project = project
    }

    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init!(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.hidesBackButton = true
        self.tableView.backgroundColor = UIColor(red: 60.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        
        self.tableView.registerClass(BRProfileLargeHeaderTableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        self.tableView.registerClass(BRProfileCloseButtonTableViewCell.self, forCellReuseIdentifier: closeIdentifier)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }


    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return indexPath.section == 0 ? BRProfileLargeHeaderTableViewCell.heightForProject(project, width: self.tableView.frame.size.width) : 50.0
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! BRProfileLargeHeaderTableViewCell
            cell.project = project
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(closeIdentifier, forIndexPath: indexPath) as! BRProfileCloseButtonTableViewCell
            cell.button.addTarget(self, action: "closeTapped:", forControlEvents: .TouchUpInside)
            return cell
        }
    }
    
    func closeTapped(sender: UIButton!) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    

}
