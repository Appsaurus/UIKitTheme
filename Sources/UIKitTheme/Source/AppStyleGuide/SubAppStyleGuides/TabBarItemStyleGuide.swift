//
//  TabBarItemStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class TabBarItemStyleDefaults: SubAppStyleGuideDefaults {

	//UITabBarItem //Note: Will only apply if images is set with UIImageRenderingModeAlwaysOriginal, otherwise tabBarTintColor is used
	open lazy var normalTextColor: UIColor = colors.functional.deselected
	open lazy var selectedTextColor: UIColor = colors.functional.selected
	open lazy var normalIconColor: UIColor? = colors.functional.deselected
	open lazy var selectedIconColor: UIColor? = colors.functional.selected

}
open class TabBarItemStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = TabBarItemStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)
	open lazy var defaultStyle: TabBarItemStyle = TabBarItemStyle(normalTextColor: defaults.normalTextColor,
																  selectedTextColor: defaults.selectedTextColor,
																  normalIconColor: defaults.normalIconColor,
																  selectedIconColor: defaults.selectedIconColor)

	open override func applyAppearanceProxySettings() {
		UITabBarItem.appearance().apply(tabBarItemStyle: defaultStyle)
	}
}

// MARK: Convenience Extensions
// Make it easy to access functions from current style guide inside method signatures at call site.
extension TabBarItemStyle {
	public static var defaultStyle: TabBarItemStyle {
		return App.style.tabBarItem.defaultStyle
	}
}
