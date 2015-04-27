//
//  BRExperienceTableViewCell.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

class BRExperienceTableViewCell: BRHomeTableViewCell {
    
    var titleLabel = UILabel()
    var experienceLevelLabel = UILabel()
    
    var experience: BRExperience = BRExperience() {
        didSet {
            titleLabel.text = experience.name
            experienceLevelLabel.text = experience.experienceLevel == BRExperienceLevel.Comfortable ? "Experienced and confident" : "Faily experienced"
        }
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        titleLabel.font = UIFont(name: "Avenir-Roman", size: 20.0)
        titleLabel.textColor = UIColor(white: 0.9, alpha: 1.0)
        titleLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(titleLabel)
        
        let titleLabelLeft = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 11.0)
        let titleLabelTop = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 6.0)
        let titleLabelRight = NSLayoutConstraint(item: titleLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: innerContentView, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: -50)
        innerContentView.addConstraints([titleLabelLeft, titleLabelTop, titleLabelRight])

        experienceLevelLabel.font = UIFont(name: "Avenir-Book", size: 18.0)
        experienceLevelLabel.textColor = UIColor(white: 0.8, alpha: 1.0)
        experienceLevelLabel.setTranslatesAutoresizingMaskIntoConstraints(false)
        innerContentView.addSubview(experienceLevelLabel)
        
        let experienceLevelLabelTop = NSLayoutConstraint(item: experienceLevelLabel, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Bottom, multiplier: 1.0, constant: -1.0)
        let experienceLevelLabelLeft = NSLayoutConstraint(item: experienceLevelLabel, attribute: NSLayoutAttribute.Left, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Left, multiplier: 1.0, constant: 0.0)
        let experienceLevelLabelRight = NSLayoutConstraint(item: experienceLevelLabel, attribute: NSLayoutAttribute.Right, relatedBy: NSLayoutRelation.Equal, toItem: titleLabel, attribute: NSLayoutAttribute.Right, multiplier: 1.0, constant: 0.0)
        innerContentView.addConstraints([experienceLevelLabelTop, experienceLevelLabelLeft, experienceLevelLabelRight])

    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
