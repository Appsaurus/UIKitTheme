//
//  BarButtonItemStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class BarButtonItemStyleDefaults: SubAppStyleGuideDefaults {
	open var fontSize: CGFloat = 17.0
	open lazy var fontIconSize: CGFloat = fontSize * 1.5
	open lazy var textStyle: TextStyle =  text.regular(color: colors.primaryContrast, size: fontSize)
	open lazy var tintColor: UIColor = colors.primaryContrast
}

open class BarButtonItemStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = BarButtonItemStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open lazy var defaultStyle: BarButtonItemStyle = BarButtonItemStyle(titleTextStyle: defaults.textStyle,
																		tintColor: defaults.tintColor)

	open override func applyAppearanceProxySettings() {
//		UIBarButtonItem.appearance().apply(barButtonItemStyle: defaultStyle)
	}

}

// MARK: Convenience Extensions
// Make it easy to access functions from current style guide inside method signatures at call site.
extension BarButtonItemStyle {
	public static var defaultStyle: BarButtonItemStyle {
		return App.style.barButtonItem.defaultStyle
	}
}

extension CGFloat {
	public static var barButtonFontIconSize: CGFloat {
		return App.style.barButtonItem.defaults.fontIconSize
	}
	public static var barButtonFontSize: CGFloat {
		return App.style.barButtonItem.defaults.fontSize
	}
}
