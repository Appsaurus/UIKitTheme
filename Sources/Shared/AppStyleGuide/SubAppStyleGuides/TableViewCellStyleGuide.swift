//
//  TableViewCellStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/10/18.
//


import UIKit

open class TableViewCellStyleDefaults: SubAppStyleGuideDefaults{
	open lazy var viewStyle: ViewStyle = ViewStyle()
	open lazy var selectedBackgroundColor: UIColor? = nil
	open lazy var selectionStyle: UITableViewCell.SelectionStyle = .none
}

open class TableViewCellStyleGuide: SubAppStyleGuide, DefaultSettingsManaged{

	public typealias Defaults = TableViewCellStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open lazy var defaultStyle: TableViewCellStyle = TableViewCellStyle(viewStyle: defaults.viewStyle,
																		selectedBackgroundColor: defaults.selectedBackgroundColor,
																		selectionStyle: defaults.selectionStyle)


	open override func applyAppearanceProxySettings() {
		UITableViewCell.appearance().apply(tableViewCellStyle: self.defaultStyle)
	}

}

//MARK: Convenience Extensions
//Make it easy to access functions from current style guide inside method signatures at call site.
extension TableViewCellStyle{
	public static var defaultStyle: TableViewCellStyle {
		return App.style.tableViewCell.defaultStyle
	}
}


