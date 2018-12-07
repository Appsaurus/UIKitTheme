//
//  TabBarStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import Foundation

import UIKit


open class TabBarStyleDefaults: SubAppStyleGuideDefaults{
	open var opaque: Bool = true
	open lazy var backgroundColor: UIColor = colors.primaryContrast
	open lazy var tintColor: UIColor = colors.primary
}

open class TabBarStyleGuide: SubAppStyleGuide, DefaultSettingsManaged{

	public typealias Defaults = TabBarStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open override func applyAppearanceProxySettings() {
		UITabBar.appearance().apply(tabBarStyle: self.defaultStyle)
	}

	open lazy var defaultStyle: TabBarStyle = TabBarStyle(tintColor: defaults.tintColor, backgroundColor: defaults.backgroundColor, opaque: defaults.opaque)

	open func primary(opaque: Bool? = nil) -> TabBarStyle {
		return TabBarStyle(tintColor: colors.primaryContrast, backgroundColor: colors.primary, opaque: opaque ?? defaults.opaque)
	}

	open func primaryContrast(opaque: Bool? = nil) -> TabBarStyle {
		return TabBarStyle(tintColor: colors.primary, backgroundColor: colors.primaryContrast, opaque: opaque ?? defaults.opaque)
	}
}

//MARK: Convenience Extensions
//Make it easy to access functions from current style guide inside method signatures at call site.
extension TabBarStyle{
	public static var defaultStyle: TabBarStyle{
		return App.style.tabBar.defaultStyle
	}
	public static func primary(opaque: Bool? = nil) -> TabBarStyle {
		return App.style.tabBar.primary(opaque: opaque)
	}

	public static func primaryContrast(opaque: Bool? = nil) -> TabBarStyle {
		return App.style.tabBar.primaryContrast(opaque: opaque)
	}
}
