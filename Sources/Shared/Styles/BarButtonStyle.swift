//
//  BarButtonItemStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import Foundation
import UIKit

open class BarButtonItemStyle: Style{
	open var titleTextStyle: TextStyle
	open var tintColor: UIColor
    public init(titleTextStyle: TextStyle, tintColor: UIColor) {
        self.titleTextStyle = titleTextStyle
        self.tintColor = tintColor
    }
}

public protocol BarButtonItemStyleable{
	func apply(barButtonItemStyle style: BarButtonItemStyle)
}

extension UIBarButtonItem: BarButtonItemStyleable{
	public func apply(barButtonItemStyle style: BarButtonItemStyle){
		let textAttributes: [NSAttributedString.Key : Any] = style.titleTextStyle.attributeDictionary
		setTitleTextAttributes(textAttributes, for: .normal)
		setTitleTextAttributes(textAttributes, for: .highlighted)
		tintColor = style.tintColor
	}
}

