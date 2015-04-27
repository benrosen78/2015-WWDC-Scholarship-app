//
//  BRProfileDetailedViewController.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

let headerCellIdentifier = "UserDetail.Header"
let slideshowCellIdentifier = "UserDetail.Slideshow"
let profileCloseIdentifier = "UserDetail.Close"

class BRProfileDetailedViewController: UITableViewController {

    var user = BRUser()
    
    init(user: BRUser!) {
        super.init(style: UITableViewStyle.Grouped)
        
        self.user = user
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
        
        self.tableView.registerClass(BRProfileLargeHeaderTableViewCell.self, forCellReuseIdentifier: headerCellIdentifier)
        self.tableView.registerClass(BRProfileSlideshowTableViewCell.self, forCellReuseIdentifier: slideshowCellIdentifier)
        self.tableView.registerClass(BRProfileCloseButtonTableViewCell.self, forCellReuseIdentifier: profileCloseIdentifier)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch (indexPath.section) {
        case 0:
            return BRProfileLargeHeaderTableViewCell.heightForUser(user, width: self.tableView.frame.size.width)
        case 1:
            return 225.0
        case 2:
            return 50.0
        default:
            return 0.0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> BRHomeTableViewCell {
        if (indexPath.section == 0) {
            var cell = tableView.dequeueReusableCellWithIdentifier(headerCellIdentifier, forIndexPath: indexPath) as! BRProfileLargeHeaderTableViewCell
            cell.user = user
            return cell
        } else if (indexPath.section == 1) {
            var cell = tableView.dequeueReusableCellWithIdentifier(slideshowCellIdentifier, forIndexPath: indexPath) as! BRProfileSlideshowTableViewCell
            cell.user = user
            cell.slideshowSize = CGSizeMake(self.tableView.frame.size.width-44.0, 225.0)
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier(profileCloseIdentifier, forIndexPath: indexPath) as! BRProfileCloseButtonTableViewCell
            cell.button.addTarget(self, action: "closeTapped:", forControlEvents: .TouchUpInside)
            return cell
        }
    }
    
    func closeTapped(sender: UIButton!) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
