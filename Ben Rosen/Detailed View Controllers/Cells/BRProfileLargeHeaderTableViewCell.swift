//
//  BRProfileLargeHeaderTableViewCell.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

class BRProfileLargeHeaderTableViewCell: BRHomeTableViewCell {

    var nameLabel = UILabel()
    var longBio = UILabel()
    
    var user: BRUser = BRUser() {
        didSet {
            nameLabel.text = user.fullName.uppercaseString
            longBio.text = user.longDetailedBio
        }
    }
    
    var project: BRProject = BRProject() {
        didSet {
            nameLabel.text = project.name.uppercaseString
            longBio.text = project.longDescription
        }
    }

    class func heightForCalculatedString(string: String, width: CGFloat) -> CGFloat {
        let font = UIFont(name: "Avenir-Book", size: 20.0) ?? UIFont.systemFontOfSize(20.0)
        var attributedString = NSAttributedString(string: string, attributes: [NSFontAttributeName: font])
        
        let size = attributedString.boundingRectWithSize(CGSizeMake(width - 84.0, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil).size
        return size.height+69.0
    }
    
    class func heightForUser(user: BRUser, width: CGFloat) -> CGFloat {
        return heightForCalculatedString(user.longDetailedBio, width: width)
    }
    
    class func heightForProject(project: BRProject, width: CGFloat) -> CGFloat {
        return heightForCalculatedString(project.longDescription, width: width)
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        nameLabel.font = UIFont(name: "Avenir-Roman", size: 33.0)
        nameLabel.textAlignment = .Center
        nameLabel.textColor = UIColor(white: 0.9, alpha: 1.0)
        nameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(nameLabel)
        
        let nameLabelCenterX = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let nameLabelTop = NSLayoutConstraint(item: nameLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 15.0)
        innerContentView.addConstraints([nameLabelCenterX, nameLabelTop])

        longBio.numberOfLines = 0
        longBio.font = UIFont(name: "Avenir-Book", size: 20.0)
        longBio.textColor = UIColor(white: 0.7, alpha: 1.0)
        longBio.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(longBio)
        
        let longBioCenterX = NSLayoutConstraint(item: longBio, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let longBioLeft = NSLayoutConstraint(item: longBio, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0)
        let longBioRight = NSLayoutConstraint(item: longBio, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0)
        let longBioTop = NSLayoutConstraint(item: longBio, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: nameLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 2.0)
        innerContentView.addConstraints([longBioCenterX, longBioLeft, longBioRight, longBioTop])
    
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
