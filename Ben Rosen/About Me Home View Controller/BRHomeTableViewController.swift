//
//  BRHomeTableViewController.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/25/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

extension UINavigationBar {
    override public func sizeThatFits(size: CGSize) -> CGSize {
        return CGSizeMake(self.frame.size.width, 2)
    }
}

let profileCellIdentifier = "Home.Cell.Profile"
let projectCellIdentifier = "Home.Cell.Projects"
let experienceCellIdentifier = "Home.Cell.Experience"

let user = BRUser.benRosenUser()
let projects = BRProject.benRosenProjects()
let experience = BRExperience.benRosenExperience()

class BRHomeTableViewController: UITableViewController {
    
    init () {
        super.init(style: UITableViewStyle.Grouped)
    }
    
    required override init!(nibName nibNameOrNil: String!, bundle nibBundleOrNil: NSBundle!) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init!(coder aDecoder: NSCoder!) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        self.navigationController?.navigationBarHidden = false
        self.navigationItem.setHidesBackButton(true, animated: false)
        self.tableView.backgroundColor = UIColor(red: 60.0/255.0, green: 45.0/255.0, blue: 45.0/255.0, alpha: 1.0)
        
        self.tableView.registerClass(BRProfileTableViewCell.self, forCellReuseIdentifier: profileCellIdentifier)
        self.tableView.registerClass(BRProjectTableViewCell.self, forCellReuseIdentifier: projectCellIdentifier)
        self.tableView.registerClass(BRExperienceTableViewCell.self, forCellReuseIdentifier: experienceCellIdentifier)
        self.tableView.separatorStyle = UITableViewCellSeparatorStyle.None
    }

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        switch indexPath.section {
        case 0:
            return BRProfileTableViewCell.heightForUser(user, size: self.tableView.frame.size)
        case 1:
            return 120.0
        case 2:
            return 65.0
        default:
            return 0.0
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return projects.count
        case 2:
            return experience.count
        default:
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> BRHomeTableViewCell {
        if indexPath.section == 0 {
            var cell = tableView.dequeueReusableCellWithIdentifier(profileCellIdentifier, forIndexPath: indexPath) as! BRProfileTableViewCell
            cell.tapButton.addTarget(self, action: "profileTapped:", forControlEvents: .TouchUpInside)
            cell.user = user
            return cell;
        } else if indexPath.section == 1 {
            var cell = tableView.dequeueReusableCellWithIdentifier(projectCellIdentifier, forIndexPath: indexPath) as! BRProjectTableViewCell
            cell.tapButton.addTarget(self, action: "projectTapped:", forControlEvents: .TouchUpInside)
            cell.project = projects[indexPath.row]
            return cell;
        } else {
            var cell = tableView.dequeueReusableCellWithIdentifier(experienceCellIdentifier, forIndexPath: indexPath) as! BRExperienceTableViewCell
            cell.experience = experience[indexPath.row]
            return cell;
        }
    }
    
    func indexPathForButton(sender: UIButton!) -> NSIndexPath! {
        return self.tableView.indexPathForCell(sender.superview?.superview?.superview as! UITableViewCell)
    }
    
    func profileTapped(sender: UIButton!) {
        var detailedProfile = BRProfileDetailedViewController(user: user)
        self.navigationController?.pushViewController(detailedProfile, animated: true)
    }
    
    func projectTapped(sender: UIButton!) {
        let indexPath = indexPathForButton(sender)
        let project = projects[indexPath.row]
        var detailedProject = BRProjectDetailedViewController(project: project)
        self.navigationController?.pushViewController(detailedProject, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
