//
//  AppDelegate.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/25/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent;
        
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        // Override point for customization after application launch.
        self.window!.backgroundColor = UIColor.whiteColor()
        
        let introViewController = BRIntroductionViewController()
        
        let navigationController = UINavigationController(rootViewController: introViewController)

        UINavigationBar.appearance().barTintColor = UIColor(red:75.0/255.0, green:51.0/255.0, blue:51.0/255.0, alpha:1.0)
        UINavigationBar.appearance().translucent = false;
        
        self.window!.rootViewController = navigationController;
    
        self.window!.makeKeyAndVisible()
        return true
    }

}

