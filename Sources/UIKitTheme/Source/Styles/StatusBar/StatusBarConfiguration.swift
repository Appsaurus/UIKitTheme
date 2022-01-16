//
//  StatusBarStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/29/18.
//

import UIKit

open class StatusBarConfiguration: Style {
    open var hidden: Bool
    open var style: UIStatusBarStyle
    open var animation: UIStatusBarAnimation
    
    public init(hidden: Bool = false,
                style: UIStatusBarStyle = .lightContent,
                animation: UIStatusBarAnimation = .fade) {
        self.hidden = hidden
        self.style = style
        self.animation = animation
    }
    
    public static var `default`: StatusBarConfiguration { return StatusBarConfiguration() }
}
