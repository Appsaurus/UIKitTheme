//
//  TableViewStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class TableViewStyleDefaults: SubAppStyleGuideDefaults {
	open lazy var cellSeparatorColor: UIColor = colors.text.mediumLight
	open var hidesEmptyCells: Bool = true
	open var hidesSeparatorInset: Bool = true
	open lazy var viewStyle: ViewStyle = ViewStyle.init(backgroundColor: appStyleGuide.viewControllerBaseViewBackgroundColor)
}

open class TableViewStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = TableViewStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open lazy var defaultStyle: TableViewStyle = TableViewStyle(viewStyle: defaults.viewStyle,
																cellSeparatorColor: defaults.cellSeparatorColor,
																hidesEmptyCells: defaults.hidesEmptyCells,
																hidesSeparatorInset: defaults.hidesSeparatorInset)

	open override func applyAppearanceProxySettings() {
		UITableView.appearance().apply(tableViewStyle: self.defaultStyle)
	}
	
}

// MARK: Convenience Extensions
// Make it easy to access functions from current style guide inside method signatures at call site.
extension TableViewStyle {
	public static var defaultStyle: TableViewStyle {
		return App.style.tableView.defaultStyle
	}
}
