//
//  TableViewCellStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/10/18.
//

import Foundation
import UIKit

open class TableViewCellStyle: Style{
	open var viewStyle: ViewStyle
	open var selectedBackgroundColor: UIColor?
	open var selectionStyle: UITableViewCell.SelectionStyle = .none
    public init(viewStyle: ViewStyle, selectedBackgroundColor: UIColor? = nil, selectionStyle: UITableViewCell.SelectionStyle? = nil) {
        self.viewStyle = viewStyle
        self.selectedBackgroundColor = selectedBackgroundColor
        if let selectionStyle = selectionStyle { self.selectionStyle = selectionStyle }
    }
}

public protocol TableViewCellStyleable{
	func apply(tableViewCellStyle style: TableViewCellStyle)
}

extension UITableViewCell: TableViewCellStyleable{
    
	public func apply(tableViewCellStyle style: TableViewCellStyle){
		apply(viewStyle: style.viewStyle, optimizeRendering: false)
		self.selectionStyle = style.selectionStyle
		self.setSelectedBackground(color: style.selectedBackgroundColor)

	}
}

extension UIColor{
	public static var tableViewCellSelectedBackgroundColor: UIColor?{
		return App.style.tableViewCell.defaults.selectedBackgroundColor
	}
}

public extension UITableViewCell{
    public func applyClearBackground(){
        backgroundColor = UIColor.clear
        backgroundView?.backgroundColor = UIColor.clear
    }
    
    public func hideSeparatorInset(){
        self.layoutMargins = UIEdgeInsets.zero
        self.separatorInset = UIEdgeInsets.zero
    }
    
    public func setSelectedBackground(color: UIColor?){
        guard let color = color else{
            self.selectedBackgroundView = nil
            return
        }
        let bgView = UIView()
        bgView.backgroundColor = color
        self.selectedBackgroundView = bgView
    }
    
}
