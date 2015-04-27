//
//  BRUser.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/25/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

struct BRUser {
    var fullName: String
    var profileImage: UIImage
    var userBio: String
    var longDetailedBio: String
    var userPictures: [UIImage?]
    
    static func benRosenUser () -> BRUser {
        var user = BRUser()
        user.fullName = "Ben Rosen"
        user.profileImage = UIImage(named: "profilepic")!
        user.userBio = "I'm a 12 year old full stack developer. In my free time, I like to program and run outside. I live in the suburbs of Chicago"
        user.longDetailedBio = "I started learning to program the summer of 2014 and I found it really interesting. I'm 100% self taught, I learned all from books, no courses or anything. I'm still relatively new so I don't have much released. What inspired me to start is a process called Jailbreaking, which allows you to modify your iPhone/iPod/iPad the way you want to. I started programming what are called Jailbreak tweaks and I then I was able to modify SpringBoard's code, with just the interface- no implementation. I met a bunch of awesome people and learned a lot through open sourced code. See some pictures of my family and I below. Enjoy my app and have a nice day! :)"
        user.userPictures = [UIImage(named: "slideshow1"), UIImage(named: "slideshow2"), UIImage(named: "slideshow3"), UIImage(named: "slideshow4")]

        return user;
    }
    
}

extension BRUser {
    init() {
        fullName = ""
        profileImage = UIImage()
        userBio = ""
        longDetailedBio = ""
        userPictures = []
    }
}
