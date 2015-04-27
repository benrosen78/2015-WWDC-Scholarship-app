//
//  BRExperience.swift
//  Ben Rosen
//
//  Created by Ben Rosen on 4/26/15.
//  Copyright (c) 2015 Ben Rosen. All rights reserved.
//

import UIKit

enum BRExperienceLevel {
    case Comfortable
    case SoSo
}

struct BRExperience {
    var name: String
    var experienceLevel: BRExperienceLevel
    
    static func benRosenExperience() -> [BRExperience] {
        
        var objectiveCExperience = BRExperience()
        objectiveCExperience.name = "Objective-C"
        objectiveCExperience.experienceLevel = BRExperienceLevel.Comfortable
        
        var phpExperience = BRExperience()
        phpExperience.name = "PHP"
        phpExperience.experienceLevel = BRExperienceLevel.Comfortable
        
        var swiftExperience = BRExperience()
        swiftExperience.name = "Swift"
        swiftExperience.experienceLevel = BRExperienceLevel.SoSo
        
        var webLanguagesExperience = BRExperience()
        webLanguagesExperience.name = "HTML/CSS/JS"
        webLanguagesExperience.experienceLevel = BRExperienceLevel.SoSo

        return [objectiveCExperience, phpExperience, swiftExperience, webLanguagesExperience]
        
    }

}

extension BRExperience {
    init() {
        name = ""
        experienceLevel = BRExperienceLevel.SoSo
    }
}
