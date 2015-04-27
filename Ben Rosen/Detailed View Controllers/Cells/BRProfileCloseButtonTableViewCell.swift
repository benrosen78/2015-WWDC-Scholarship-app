//
//  BRProfileCloseButtonTableViewCell.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

class BRProfileCloseButtonTableViewCell: BRHomeTableViewCell {
   
    var button = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        button.titleLabel?.textAlignment = .Center
        button.setTitle("close", forState: .Normal)
        button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Medium", size: 18.0)
        button.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(button)
        
        let buttonLeft = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let buttonRight = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        let buttonTop = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        let buttonBottom = NSLayoutConstraint(item: button, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        innerContentView.addConstraints([buttonLeft, buttonRight, buttonTop, buttonBottom])

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
