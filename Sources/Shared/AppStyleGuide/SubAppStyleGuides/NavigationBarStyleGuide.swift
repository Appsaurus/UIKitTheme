//
//  NavigationBarStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import Foundation
import UIKit

open class NavigationBarStyleDefaults: SubAppStyleGuideDefaults {
	open var titleFontSize: CGFloat = 17.0
	open var backButtonImage: UIImage?
	open var hidesBottomHairline: Bool = true
	open lazy var titleFont: UIFont = fonts.regular(titleFontSize)
	open func titleTextStyle(color: UIColor, font: UIFont? = nil) -> TextStyle {
		return TextStyle(color: color, font: font ?? titleFont)
	}
}

open class NavigationBarStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = NavigationBarStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open lazy var defaultStyle: NavigationBarStyle = primary

	open override func applyAppearanceProxySettings() {
		assert(defaultStyle.transparent == false, "Cannot have default nav bar style be transparent since it cannot be done via appearance proxy.")
        UINavigationBar.appearance().apply(navigationBarStyle: defaultStyle, appearanceProxyFriendly: true)
	}

	open var primary: NavigationBarStyle {
		return NavigationBarStyle(barColor: colors.primary,
								  titleTextStyle: defaults.titleTextStyle(color: colors.primaryContrast),
								  hidesBottomHairline: defaults.hidesBottomHairline)
	}

	open var primaryContrast: NavigationBarStyle {
		return NavigationBarStyle(barColor: colors.primaryContrast,
								  titleTextStyle: defaults.titleTextStyle(color: colors.primary),
								  hidesBottomHairline: defaults.hidesBottomHairline)
	}

	open var gradient: NavigationBarStyle {
		let gradient = GradientConfiguration(colors: [colors.primary, colors.primaryDark], orientation: .leftRight)
		return  NavigationBarStyle(gradient: gradient,
								   titleTextStyle: defaults.titleTextStyle(color: colors.primaryContrast),
								   translucent: false,
								   transparent: false,
								   hidesBottomHairline: defaults.hidesBottomHairline)
	}

	open var transparent: NavigationBarStyle {
		return NavigationBarStyle(titleTextStyle: defaults.titleTextStyle(color: colors.primaryContrast),
								  transparent: true,
								  hidesBottomHairline: true)
	}
}

// MARK: Convenience Extensions
//Make it easy to access functions from current style guide inside method signatures at call site.
extension NavigationBarStyle {

	public static var `default`: NavigationBarStyle {
		return App.style.navigationBar.defaultStyle
	}

	public static var primary: NavigationBarStyle {
		return App.style.navigationBar.primary
	}

	public static var primaryContrast: NavigationBarStyle {
		return App.style.navigationBar.primaryContrast
	}

	public static var gradient: NavigationBarStyle {
		return App.style.navigationBar.gradient
	}

	public static var transparent: NavigationBarStyle {
		return App.style.navigationBar.transparent
	}
}
