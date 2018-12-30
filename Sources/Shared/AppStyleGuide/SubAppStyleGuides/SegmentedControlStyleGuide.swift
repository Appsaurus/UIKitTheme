//
//  SegmentedControlStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class SegmentedControlStyleDefaults: SubAppStyleGuideDefaults {
	open lazy var tintColor: UIColor = colors.primary
	open lazy var selectedTextColor: UIColor = colors.primaryContrast

}

open class SegmentedControlStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = SegmentedControlStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open lazy var defaultStyle: SegmentedControlStyle =  SegmentedControlStyle(tintColor: defaults.tintColor,
																			   selectedTextColor: defaults.selectedTextColor)

	open override func applyAppearanceProxySettings() {
		UISegmentedControl.appearance().apply(segmentedControlStyle: defaultStyle)
	}
}

// MARK: Convenience Extensions
//Make it easy to access functions from current style guide inside method signatures at call site.
extension SegmentedControlStyle {
	public static var defaultStyle: SegmentedControlStyle {
		return App.style.segmentedControl.defaultStyle
	}
}
