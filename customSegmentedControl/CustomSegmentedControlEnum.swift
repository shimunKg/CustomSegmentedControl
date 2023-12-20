//
//  CustomSegmentedControlEnum.swift
//  customSegmentedControl
//
//  Created by Nikola Jovanovic Simunic on 20.12.23..
//

import Foundation


enum CustomSegmentedControl: HasTitle, Hashable {
    case home
    case profile
    case settings
    case filtered
    case views(numerOfViews: Int)
  
    
    var title: String {
        switch self {
        case .home:
            return "Home"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        case .filtered:
            return "Filtered"
        case .views(let numerOfViews):
            return "Views (\(numerOfViews))"
        }
    }
}
