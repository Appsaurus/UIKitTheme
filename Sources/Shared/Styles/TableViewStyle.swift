//
//  TableViewStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import Foundation
import UIKit

open class TableViewStyle: Style {

    open var viewStyle: ViewStyle?
    open var cellSeparatorColor: UIColor?
    open var hidesEmptyCells: Bool?
    open var hidesSeparatorInset: Bool?

    public init(viewStyle: ViewStyle? = nil,
                cellSeparatorColor: UIColor? = nil,
                hidesEmptyCells: Bool? = nil,
                hidesSeparatorInset: Bool? = nil) {
        self.viewStyle = viewStyle
        self.cellSeparatorColor = cellSeparatorColor
        self.hidesEmptyCells = hidesEmptyCells
        self.hidesSeparatorInset = hidesSeparatorInset
    }

}

public protocol TableViewStyleable {
    func apply(tableViewStyle style: TableViewStyle)
}

extension UITableView: TableViewStyleable {

    public func apply(tableViewStyle style: TableViewStyle) {
        if let viewStyle = style.viewStyle {
            apply(viewStyle: viewStyle, optimizeRendering: false)
        }
        separatorColor = style.cellSeparatorColor
        if style.hidesSeparatorInset == true {
            hideSeparatorInset()
        }
        if style.hidesEmptyCells == true {
            hideEmptyCellsAtBottomOfTable()
        }
    }
}

extension UIColor {
    public static var tableViewCellSeparatorColor: UIColor {
        return App.style.tableView.defaults.cellSeparatorColor
    }
}
