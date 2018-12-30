//
//  CollectionViewStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/10/18.
//

import UIKit

open class CollectionViewStyleDefaults: SubAppStyleGuideDefaults {
	open lazy var viewStyle: ViewStyle = ViewStyle(backgroundColor: appStyleGuide.viewControllerBaseViewBackgroundColor)
}

open class CollectionViewStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = CollectionViewStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open lazy var defaultStyle: CollectionViewStyle = CollectionViewStyle(viewStyle: defaults.viewStyle)

	open override func applyAppearanceProxySettings() {
		UICollectionView.appearance().apply(collectionViewStyle: self.defaultStyle)
	}

}

// MARK: Convenience Extensions
//Make it easy to access functions from current style guide inside method signatures at call site.
extension CollectionViewStyle {
	public static var defaultStyle: CollectionViewStyle {
		return App.style.collectionView.defaultStyle
	}
}
