//
//  TabBarStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

public protocol TabBarStyleable{
	func apply(tabBarStyle: TabBarStyle)
}


open class TabBarStyle: Style{
		open var tintColor: UIColor
		open var backgroundColor: UIColor?
		open var opaque: Bool
    public init(tintColor: UIColor, backgroundColor: UIColor?, opaque: Bool) {
        self.tintColor = tintColor
        self.backgroundColor = backgroundColor
        self.opaque = opaque
    }
}

extension UITabBar : TabBarStyleable{

	public func apply(tabBarStyle: TabBarStyle) {
		tintColor = tabBarStyle.tintColor
		backgroundColor = tabBarStyle.backgroundColor
		isOpaque = tabBarStyle.opaque
	}
}

