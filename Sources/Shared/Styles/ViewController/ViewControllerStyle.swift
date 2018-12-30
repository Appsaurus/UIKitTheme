//
//  ViewControllerStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/29/18.
//

import Foundation

open class ViewControllerStyle: Style {
    open var navigationBarStyle: NavigationBarStyle
    open var viewStyle: ViewStyle
    
    public required init(navigationBarStyle: NavigationBarStyle = .default,
                         viewStyle: ViewStyle = ViewStyle(backgroundColor: .viewControllerBaseViewBackgroundColor)) {
        self.navigationBarStyle = navigationBarStyle
        self.viewStyle = viewStyle
    }
    
    public static var `default`: ViewControllerStyle { return ViewControllerStyle() }
}
