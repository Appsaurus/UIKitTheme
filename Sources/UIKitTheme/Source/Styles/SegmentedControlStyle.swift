//
//  SegmentedControlStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

public protocol SegmentedControlStyleable {
	func apply(segmentedControlStyle: SegmentedControlStyle)
}

open class SegmentedControlStyle: Style {
// Applies to the selected background color, border, and unselected text color
	open var tintColor: UIColor?
	open var selectedTextColor: UIColor
    open var selectedSegmentTintColor: UIColor?
    public init(tintColor: UIColor?, selectedTextColor: UIColor, selectedSegmentTintColor: UIColor?) {
        self.tintColor = tintColor
        self.selectedTextColor = selectedTextColor
        self.selectedSegmentTintColor = selectedSegmentTintColor ?? tintColor
    }
}

extension UISegmentedControl: SegmentedControlStyleable {
	public func apply(segmentedControlStyle: SegmentedControlStyle) {
		self.tintColor = segmentedControlStyle.tintColor
        if #available(iOS 13.0, *) {
            self.selectedSegmentTintColor = segmentedControlStyle.selectedSegmentTintColor
        }
		let selectedAttributes: [NSAttributedString.Key: Any] = [.foregroundColor: segmentedControlStyle.selectedTextColor]
		self.setTitleTextAttributes(selectedAttributes, for: .selected)
	}
}
