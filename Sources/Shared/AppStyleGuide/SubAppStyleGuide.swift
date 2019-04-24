//
//  SubAppStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import Foundation

public protocol AppStyleGuideDerived {
	var appStyleGuide: AppStyleGuide { get set }
	init(appStyleGuide: AppStyleGuide)
}

extension AppStyleGuideDerived {
	// MARK: Convenience
	public var colors: ColorScheme {
		return appStyleGuide.colors
	}
	public var fonts: FontGuide {
		return appStyleGuide.secondaryFonts
	}
	public var text: TextStyleGuide {
		return appStyleGuide.text
	}

	public var views: ViewStyleGuide {
		return appStyleGuide.views
	}

	public var shadows: ShadowStyleGuide {
		return appStyleGuide.shadows
	}

	public var buttons: ButtonStyleGuide {
		return appStyleGuide.buttons
	}
	public var textField: TextFieldStyleGuide {
		return appStyleGuide.textField
	}
	public var barButtonItem: BarButtonItemStyleGuide {
		return appStyleGuide.barButtonItem
	}

	public var navigationBar: NavigationBarStyleGuide {
		return appStyleGuide.navigationBar
	}
	public var segmentedControl: SegmentedControlStyleGuide {
		return appStyleGuide.segmentedControl
	}
	public var tabBar: TabBarStyleGuide {
		return appStyleGuide.tabBar
	}
	public var tabBarItem: TabBarItemStyleGuide {
		return appStyleGuide.tabBarItem
	}
	public var tableView: TableViewStyleGuide {
		return appStyleGuide.tableView
	}
	public var tableViewCell: TableViewCellStyleGuide {
		return appStyleGuide.tableViewCell
	}
	public var collectionView: CollectionViewStyleGuide {
		return appStyleGuide.collectionView
	}
	public var collectionViewCell: CollectionViewCellStyleGuide {
		return appStyleGuide.collectionViewCell
	}

}

public protocol DefaultSettingsManaged: AppStyleGuideDerived {
	associatedtype Defaults: AppStyleGuideDerived
	var defaults: Defaults { get set }
}

//extension DefaultSettingsManaged{
//	public init(appStyleGuide: AppStyleGuide){
//		self.appStyleGuide = appStyleGuide
//		self.defaults = Defaults(appStyleGuide: appStyleGuide)
//	}
//}

public protocol AppearanceProxyManager {
	func applyAppearanceProxySettings()
}

extension Array where Element: AppearanceProxyManager {
	public func applyAppearanceProxySettings() {
		self.forEach { (apm) in
			apm.applyAppearanceProxySettings()
		}
	}
}

open class BaseAppStyleDerived: NSObject, AppStyleGuideDerived {
	open var appStyleGuide: AppStyleGuide
	public required init(appStyleGuide: AppStyleGuide) {
		self.appStyleGuide = appStyleGuide
	}

}
open class SubAppStyleGuide: BaseAppStyleDerived, AppearanceProxyManager {
	public func applyAppearanceProxySettings() {

	}
}

open class SubAppStyleGuideDefaults: BaseAppStyleDerived {

}
