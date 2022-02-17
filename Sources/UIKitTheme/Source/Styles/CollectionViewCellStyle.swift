//
//  CollectionViewCellStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/10/18.
//

import Foundation
import UIKit

open class CollectionViewCellStyle: Style {
	open var viewStyle: ViewStyle

	public init(viewStyle: ViewStyle) {
		self.viewStyle = viewStyle
	}
}

public protocol CollectionViewCellStyleable {
	func apply(collectionViewCellStyle style: CollectionViewCellStyle)
}
extension UICollectionViewCell: CollectionViewCellStyleable {
	public func apply(collectionViewCellStyle style: CollectionViewCellStyle) {
		apply(viewStyle: style.viewStyle, optimizeRendering: false)
	}
}
