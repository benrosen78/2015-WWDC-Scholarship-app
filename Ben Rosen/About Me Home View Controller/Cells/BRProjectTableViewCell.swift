//
//  BRProjectTableViewCell.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

class BRProjectTableViewCell: BRHomeTableViewCell {
    
    var backgroundImageView = UIImageView()
    var profileImageView = UIImageView()
    var titleLabel = UILabel()
    var shortDescriptionLabel = UILabel()
    
    var project: BRProject = BRProject() {
        didSet {
            backgroundImageView.image = project.coverImage
            profileImageView.image = project.image
            profileImageView.layer.borderColor = project.image.dominantColor().CGColor
            titleLabel.text = project.name
            shortDescriptionLabel.text = project.shortDescription
        }
    }

    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    
        backgroundImageView.alpha = 0.5
        backgroundImageView.contentMode = UIViewContentMode.ScaleAspectFill
        backgroundImageView.clipsToBounds = true
        backgroundImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(backgroundImageView)
        
        let backgroundImageViewLeft = NSLayoutConstraint(item: backgroundImageView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let backgroundImageViewRight = NSLayoutConstraint(item: backgroundImageView, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        let backgroundImageViewTop = NSLayoutConstraint(item: backgroundImageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0.0)
        let backgroundImageViewBottom = NSLayoutConstraint(item: backgroundImageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: 0.0)
        innerContentView.addConstraints([backgroundImageViewLeft, backgroundImageViewRight, backgroundImageViewTop, backgroundImageViewBottom])

        profileImageView.contentMode = UIViewContentMode.ScaleAspectFill
        profileImageView.layer.masksToBounds = true
        profileImageView.layer.cornerRadius = 10.0
        profileImageView.layer.borderWidth = 1.5
        profileImageView.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(profileImageView)
        
        let profileImageViewCenterY = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.CenterY, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: 0.0)
        let profileImageViewLeft = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 20.0)
        let profileImageViewHeight = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 65.0)
        let profileImageViewWidth = NSLayoutConstraint(item: profileImageView, attribute: NSLayoutAttribute.Width, relatedBy: NSLayoutRelation.Equal, toItem: nil, attribute: NSLayoutAttribute.Width, multiplier: 1.0, constant: 65.0)
        innerContentView.addConstraints([profileImageViewCenterY, profileImageViewLeft, profileImageViewHeight, profileImageViewWidth])
        
        titleLabel.font = UIFont(name: "Avenir-Medium", size: 33.0)
        titleLabel.textColor = UIColor(white:0.9, alpha:1.0)
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(titleLabel)
        
        let titleLabelBottom = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -2)
        let titleLabelLeft = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: profileImageView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 20.0)
        let titleLabelRight = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant:-10)
        innerContentView.addConstraints([titleLabelBottom, titleLabelLeft, titleLabelRight])
    
        shortDescriptionLabel.font = UIFont(name: "Avenir-Roman", size: 18.0)
        shortDescriptionLabel.textColor = UIColor(white: 0.8, alpha: 1.0)
        shortDescriptionLabel.numberOfLines = 2
        shortDescriptionLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(shortDescriptionLabel)
        
        let shortDescriptionLabelTop = NSLayoutConstraint(item: shortDescriptionLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.CenterY, multiplier: 1.0, constant: -3.0)
        let shortDescriptionLabelLeft = NSLayoutConstraint(item: shortDescriptionLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let shortDescriptionLabelRight = NSLayoutConstraint(item: shortDescriptionLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        innerContentView.addConstraints([shortDescriptionLabelTop, shortDescriptionLabelLeft, shortDescriptionLabelRight])
        
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
