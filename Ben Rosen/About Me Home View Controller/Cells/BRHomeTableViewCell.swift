//
//  BRHomeTableViewCell.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

class BRHomeTableViewCell: UITableViewCell {

    let innerContentView = UIView()
    let tapButton = UIButton()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = UIColor.clearColor()
        self.selectionStyle = UITableViewCellSelectionStyle.None
        
        innerContentView.backgroundColor = UIColor(red:51.0/255.0, green:37.0/255.0, blue:37.0/255.0, alpha: 1.0)
        innerContentView.layer.masksToBounds = false
        innerContentView.layer.borderWidth = 2.0
        innerContentView.layer.borderColor = UIColor(red:75.0/255.0, green:51.0/255.0, blue:51.0/255.0, alpha:1.0).CGColor
        innerContentView.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.contentView.addSubview(innerContentView)
        
        let leftConstraint = NSLayoutConstraint(item: innerContentView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 22.0)
        let rightConstraint = NSLayoutConstraint(item: innerContentView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -22.0)
        let heightConstraint = NSLayoutConstraint(item: innerContentView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: self.contentView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 0.0)
        self.contentView.addConstraints([leftConstraint, rightConstraint, heightConstraint])

        tapButton.backgroundColor = UIColor.clearColor()
        tapButton.addTarget(self, action: "buttonTouchDown:", forControlEvents: .TouchDown | .TouchDragEnter)
        tapButton.addTarget(self, action: "buttonTouchUp:", forControlEvents: .TouchCancel | .TouchDragExit | .TouchUpInside)
        tapButton.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(tapButton)
        
        let tapButtonLeft = NSLayoutConstraint(item: tapButton, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let tapButtonRight = NSLayoutConstraint(item: tapButton, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        let tapButtonTop = NSLayoutConstraint(item: tapButton, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        let tapButtonBottom = NSLayoutConstraint(item: tapButton, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        self.innerContentView.addConstraints([tapButtonLeft, tapButtonRight, tapButtonTop, tapButtonBottom])
    
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func buttonTouchDown(sender: UIButton!) {
        UIView.animateWithDuration(0.3, delay: 0.0, usingSpringWithDamping: 0.9, initialSpringVelocity: 0.0, options: .CurveEaseOut, animations: {
            sender.superview?.alpha = 0.2
        }, completion: nil)
    }
    
    func buttonTouchUp(sender: UIButton!) {
        UIView.animateWithDuration(0.4, delay: 0.0, usingSpringWithDamping: 0.4, initialSpringVelocity: 0.0, options: .CurveEaseOut, animations: {
            sender.superview?.alpha = 1.0
        }, completion: nil)
    }

}
