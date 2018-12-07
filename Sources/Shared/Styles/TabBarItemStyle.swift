//
//  TabBarItemStyle.swift
//  Pods
//
//  Created by Brian Strobach on 7/6/17.
//
//

import UIKit

public protocol TabBarItemStyleable{
    func apply(tabBarItemStyle: TabBarItemStyle)    
}


open class TabBarItemStyle: Style{
	open var normalTextColor: UIColor
	open var selectedTextColor: UIColor
	open var renderOriginal: Bool
	open var normalIconColor: UIColor
	open var selectedIconColor: UIColor

    
    public init(normalTextColor: UIColor, selectedTextColor: UIColor, renderOriginal: Bool = true, normalIconColor: UIColor? = nil, selectedIconColor: UIColor? = nil) {
        self.renderOriginal = renderOriginal
        self.normalTextColor = normalTextColor
        self.selectedTextColor = selectedTextColor
        self.normalIconColor = normalIconColor ?? normalTextColor
        self.selectedIconColor = selectedIconColor ?? selectedTextColor
    }
}

extension UITabBarItem : TabBarItemStyleable{
    
    public func apply(tabBarItemStyle: TabBarItemStyle) {
        
        setTitleTextAttributes([.foregroundColor : tabBarItemStyle.normalTextColor], for: .normal)
        setTitleTextAttributes([.foregroundColor : tabBarItemStyle.selectedTextColor], for: .selected)
		guard !(self === UITabBarItem.appearance()) else { return }
        if tabBarItemStyle.renderOriginal{
            image = image?.withRenderingMode(.alwaysOriginal)
            selectedImage = selectedImage?.withRenderingMode(.alwaysOriginal)
        }
    }
}
