//
//  CollectionViewCellStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/10/18.
//

import UIKit

open class CollectionViewCellStyleDefaults: SubAppStyleGuideDefaults {
	open lazy var viewStyle: ViewStyle = ViewStyle()
}

open class CollectionViewCellStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = CollectionViewCellStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open lazy var defaultStyle: CollectionViewCellStyle = CollectionViewCellStyle(viewStyle: defaults.viewStyle)

	open override func applyAppearanceProxySettings() {
		UICollectionViewCell.appearance().apply(collectionViewCellStyle: self.defaultStyle)
	}

}

// MARK: Convenience Extensions
// Make it easy to access functions from current style guide inside method signatures at call site.
extension CollectionViewCellStyle {
	public static var defaultStyle: CollectionViewCellStyle {
		return App.style.collectionViewCell.defaultStyle
	}
}
