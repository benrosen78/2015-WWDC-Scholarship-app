//
//  BRProject.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

struct BRProject {
    var name: String
    var shortDescription: String
    var longDescription: String
    var image: UIImage
    var coverImage: UIImage
    
    static func benRosenProjects() -> [BRProject] {

        var alloyProject = BRProject()
        alloyProject.name = "Alloy"
        alloyProject.shortDescription = "A modern communication platform for the university with events and files."
        alloyProject.longDescription = "Currently, there is no tool to quickly communicate with your professors and other students at the university. With Alloy, you can easily message professors as well as talk in group chats that you make or group chats under an event. The NYU api allows us to pull events from their server to show in our app to allow discussions. Alloy won the 2015 HackNYU competition. I am on the team that created this app."
        alloyProject.image = UIImage(named: "alloy_logo")!
        alloyProject.coverImage = UIImage(named: "alloy_cover")!
        
        var urlinqProject = BRProject()
        urlinqProject.name = "Urlinq"
        urlinqProject.shortDescription = "A learning management system that truly allows collaboration."
        urlinqProject.longDescription = "Urlinq is a fully featured LMS (learning management system) with a fast and well-thought iOS app and web app currently heavily under development. Urlinq has a planner, messaging, group creation, Google Drive sharing, and much more! I am an intern at Urlinq along with many New York University students."
        urlinqProject.image = UIImage(named: "urlinq_icon")!
        urlinqProject.coverImage = UIImage(named: "urlinq_cover")!
        
        var betaagentProject = BRProject()
        betaagentProject.name = "Beta Agent"
        betaagentProject.shortDescription = "A tool that fixes all the problems of beta testing."
        betaagentProject.longDescription = "Beta testing a product is hard-- first you have to find testers. Then you have to deploy builds securely to your testers. Then you have to ask the testers for feedback, when a lot of testers don't know how to give a developer he/she needs. Beta Agent unifies this process, with a site and mobile app to let you do all these things. I am the co-founder of this project."
        betaagentProject.image = UIImage(named: "betaagent_icon")!
        betaagentProject.coverImage = UIImage(named: "betaagent_cover")!
        
        var facesProject = BRProject()
        facesProject.name = "Faces"
        facesProject.shortDescription = "Make one of the most-seen iOS views personal to you."
        facesProject.longDescription = "This Jailbreak tweak with over 500,000 downloads lets you add images to the buttons on the iOS passcode screen making your lock screen personal to you. Programmed by me."
        facesProject.image = UIImage(named: "faces_icon")!
        facesProject.coverImage = UIImage(named: "faces_cover")!
        
        return [alloyProject, urlinqProject, betaagentProject, facesProject]
        
    }
}

extension BRProject {
    init() {
        name = ""
        shortDescription = ""
        longDescription = ""
        image = UIImage()
        coverImage = UIImage()
    }
}
