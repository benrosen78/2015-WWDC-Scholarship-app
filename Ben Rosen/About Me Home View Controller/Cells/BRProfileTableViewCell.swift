//
//  BRProfileTableViewCell.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

class BRProfileTableViewCell: BRHomeTableViewCell {
    
    var profileImageView = UIImageView()
    var fullNameLabel = UILabel()
    var bioLabel = UILabel()
    
    var user: BRUser = BRUser() {
        didSet {
            profileImageView.image = user.profileImage
            fullNameLabel.text = user.fullName.uppercaseString
            profileImageView.layer.borderColor = user.profileImage.dominantColor().CGColor
            bioLabel.text = user.userBio
        }
    }
    class func heightForUser(user: BRUser!, size: CGSize) -> CGFloat {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = .Center
       
        let font = UIFont(name: "Avenir-Book", size: 18.0) ?? UIFont.systemFontOfSize(20.0)
        var bioAttributedString = NSMutableAttributedString(string: user.userBio, attributes: [NSFontAttributeName : font])

        let nameSize = bioAttributedString.boundingRectWithSize(CGSizeMake(size.width - 84.0, CGFloat.max), options: NSStringDrawingOptions.UsesLineFragmentOrigin, context: nil).size
        return nameSize.height+200.0;
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 60.0
        profileImageView.layer.borderWidth = 1.0
        profileImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(profileImageView)
        
        let profileImageViewCenterX = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let profileImageViewTop = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 10.0)
        let profileImageViewWidth = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 120.0)
        let profileImageViewHeight = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 120.0)
        innerContentView.addConstraints([profileImageViewCenterX, profileImageViewTop, profileImageViewWidth, profileImageViewHeight])
        
        fullNameLabel.font = UIFont(name: "Avenir-Roman", size: 26.0)
        fullNameLabel.textAlignment = .Center
        fullNameLabel.textColor = UIColor(white: 0.9, alpha: 1.0)
        fullNameLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(fullNameLabel)

        let fullNameLabelCenterX = NSLayoutConstraint(item: fullNameLabel, attribute: NSLayoutAttribute.CenterX, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0)
        let fullNameLabelTop = NSLayoutConstraint(item: fullNameLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: profileImageView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 10.0)
        let fullNameLabelWidth = NSLayoutConstraint(item: fullNameLabel, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: -10)
        innerContentView.addConstraints([fullNameLabelCenterX, fullNameLabelTop, fullNameLabelWidth])
        
        bioLabel.font = UIFont(name: "Avenir-Book", size: 18.0)
        bioLabel.textColor = UIColor(white: 0.7, alpha: 1.0)
        bioLabel.numberOfLines = 0
        bioLabel.textAlignment = .Center
        bioLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(bioLabel)

        let bioLabelTop = NSLayoutConstraint(item: bioLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: fullNameLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        let bioLabelLeft = NSLayoutConstraint(item: bioLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 10.0)
        let bioLabelRight = NSLayoutConstraint(item: bioLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -10.0)
        innerContentView.addConstraints([bioLabelTop, bioLabelLeft, bioLabelRight])
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
