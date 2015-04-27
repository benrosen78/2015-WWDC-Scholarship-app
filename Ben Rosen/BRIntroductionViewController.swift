//
//  BRIntroductionViewController.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/25/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit
import CoreGraphics

class BRIntroductionViewController: UIViewController {

    var profileImageView = UIImageView()
    var nameLabel = UILabel()
    var learnMoreLabel = UILabel()
    var holdGestureRecognizer = UILongPressGestureRecognizer()
    var homeViewController = BRHomeTableViewController()
    var token: dispatch_once_t = 0

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor(red: 60.0/255.0, green:45.0/255.0, blue:45.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBarHidden = true
        
        self.profileImageView.image = UIImage(named: "profilepic")
        self.profileImageView.alpha = 0.2
        self.profileImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(self.profileImageView)
        
        let profileImageViewHeight = NSLayoutConstraint(item: self.profileImageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 264.0)
        let profileImageViewWidth = NSLayoutConstraint(item: self.profileImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 264.0)
        let profileImageViewCenterX = NSLayoutConstraint(item: self.profileImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let profileImageViewCenterY = NSLayoutConstraint(item: self.profileImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        self.view.addConstraints([profileImageViewHeight, profileImageViewWidth, profileImageViewCenterX, profileImageViewCenterY])
        
        self.nameLabel.text = "Ben Rosen"
        self.nameLabel.textColor = UIColor.whiteColor()
        self.nameLabel.alpha = 0.34
        self.nameLabel.font = UIFont(name: "BigJohn", size: 40.0)
        self.nameLabel.textAlignment = NSTextAlignment.Center
        self.nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(self.nameLabel)
        
        let nameLabelCenterX = NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let nameLabelBottom = NSLayoutConstraint(item: self.nameLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 3.0)

        self.view.addConstraints([nameLabelCenterX, nameLabelBottom])
        
        self.learnMoreLabel.text = "hold to learn more"
        self.learnMoreLabel.font = UIFont(name: "Avenir-Light", size: 30.0)
        self.learnMoreLabel.textColor = UIColor.whiteColor()
        self.learnMoreLabel.alpha = 0.34
        self.learnMoreLabel.textAlignment = NSTextAlignment.Center
        self.learnMoreLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.view.addSubview(self.learnMoreLabel)
        
        let learnMoreLabelCenterX = NSLayoutConstraint(item: self.learnMoreLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let learnMoreTop = NSLayoutConstraint(item: self.learnMoreLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -3.0)
        self.view.addConstraints([learnMoreLabelCenterX, learnMoreTop])
        
        self.holdGestureRecognizer.addTarget(self, action:"openPersonalCollectionViewController:")
        self.view.addGestureRecognizer(self.holdGestureRecognizer)

    }
    
    func openPersonalCollectionViewController(sender: UIGestureRecognizer!) {
        dispatch_once(&token) {
            self.homeViewController = BRHomeTableViewController()
            self.navigationController?.pushViewController(self.homeViewController, animated: true)
        }
    }
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesBegan(touches, withEvent: event)
        UIView.animateWithDuration(0.25, animations: {
            self.nameLabel.alpha = 0.0
            self.learnMoreLabel.alpha = 0.0
            self.profileImageView.transform = CGAffineTransformMakeScale(1.05, 1.05)
            self.profileImageView.alpha = 1.0
        })
    }
    
    override func touchesEnded(touches: Set<NSObject>, withEvent event: UIEvent) {
        super.touchesEnded(touches, withEvent: event)
        UIView.animateWithDuration(0.25, animations: {
            self.nameLabel.alpha = 0.34
            self.learnMoreLabel.alpha = 0.34
            self.profileImageView.transform = CGAffineTransformIdentity
            self.profileImageView.alpha = 0.2
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
