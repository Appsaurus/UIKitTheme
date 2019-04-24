//
//  AppStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

public protocol DefaultOverridable {
    func overrideDefaults()
    func overrideStoredDefaults()
    func overrideDerivedDefaults()
}
extension DefaultOverridable {
    public func overrideDefaults() {
        overrideStoredDefaults()
        overrideDerivedDefaults()
    }
}

open class AppStyleGuide: AppearanceProxyManager, DefaultOverridable {

	open lazy var colors: ColorScheme = ColorScheme()
	open lazy var typography: TypographyGuide = TypographyGuide()

	// MARK: SubAppStyleGuides
	open lazy var text: TextStyleGuide = TextStyleGuide(appStyleGuide: self)
	open lazy var views: ViewStyleGuide = ViewStyleGuide(appStyleGuide: self)
	open lazy var shadows: ShadowStyleGuide = ShadowStyleGuide(appStyleGuide: self)
	open lazy var buttons: ButtonStyleGuide = ButtonStyleGuide(appStyleGuide: self)
	open lazy var textField: TextFieldStyleGuide = TextFieldStyleGuide(appStyleGuide: self)

	open lazy var barButtonItem: BarButtonItemStyleGuide = BarButtonItemStyleGuide(appStyleGuide: self)
	open lazy var navigationBar: NavigationBarStyleGuide = NavigationBarStyleGuide(appStyleGuide: self)
	open lazy var segmentedControl: SegmentedControlStyleGuide = SegmentedControlStyleGuide(appStyleGuide: self)
	open lazy var tabBar: TabBarStyleGuide = TabBarStyleGuide(appStyleGuide: self)
	open lazy var tabBarItem: TabBarItemStyleGuide = TabBarItemStyleGuide(appStyleGuide: self)
	open lazy var tableView: TableViewStyleGuide = TableViewStyleGuide(appStyleGuide: self)
	open lazy var tableViewCell: TableViewCellStyleGuide = TableViewCellStyleGuide(appStyleGuide: self)
	open lazy var collectionView: CollectionViewStyleGuide = CollectionViewStyleGuide(appStyleGuide: self)
	open lazy var collectionViewCell: CollectionViewCellStyleGuide = CollectionViewCellStyleGuide(appStyleGuide: self)

    //TODO: Refactor into separate styles
    open lazy var mainWindowBackgroundColor: UIColor = colors.primary
    open lazy var viewControllerBaseViewBackgroundColor: UIColor = colors.neutrals.light
    //    open lazy var tableViewControllerBaseViewBackgroundColor: UIColor = viewControllerBaseViewBackgroundColor
    //    open lazy var collectionViewControllerBaseViewBackgroundColor: UIColor = viewControllerBaseViewBackgroundColor
    open lazy var navigationControllerBaseViewBackgroundColor: UIColor = viewControllerBaseViewBackgroundColor
    open lazy var tabBarControllerBaseViewBackgroundColor: UIColor = viewControllerBaseViewBackgroundColor
    open lazy var pagingViewControllerBaseViewBackgroundColor: UIColor = viewControllerBaseViewBackgroundColor
    open lazy var formViewControllerBackgroundColor: UIColor = colors.primary
    
	open var subStyleGuides: [SubAppStyleGuide] {
		return [
			text,
			views,
			buttons,
			textField,
			barButtonItem,
			navigationBar,
			segmentedControl,
			tabBar,
			tabBarItem,
			tableView,
			tableViewCell,
			collectionView,
			collectionViewCell
		]
	}
    
    public required init() {
        overrideDefaults()
    }
    
    open func overrideStoredDefaults() {
        
    }
    
    open func overrideDerivedDefaults() {
        
    }
    
	// MARK: AppearanceProxyManager
	open func applyAppearanceProxySettings() {
		subStyleGuides.applyAppearanceProxySettings()
	}

	open var barButtonItemStyle: ButtonStyle {
		return .flat(textStyle: .regular(color: .primaryContrast, size: .button))
	}

	open var statefulViewControllerViewBackgroundColor: UIColor? {
		return nil
	}

}

extension AppStyleGuide {
	// MARK: Convenience
    open var primaryFonts: FontGuide {
        return typography.secondaryFonts
    }

	open var secondaryFonts: FontGuide {
		return typography.secondaryFonts
	}

	open var fontSizes: FontSizingGuide {
		return typography.sizes
	}
}

extension UIColor {
	public static var mainWindowBackgroundColor: UIColor {
		return App.style.mainWindowBackgroundColor
	}
	public static var viewControllerBaseViewBackgroundColor: UIColor {
		return App.style.viewControllerBaseViewBackgroundColor
	}
//	public static var tableViewControllerBaseViewBackgroundColor: UIColor {
//		return App.style.tableViewControllerBaseViewBackgroundColor
//	}
//	public static var collectionViewControllerBaseViewBackgroundColor: UIColor {
//		return App.style.collectionViewControllerBaseViewBackgroundColor
//	}
	public static var navigationControllerBaseViewBackgroundColor: UIColor {
		return App.style.navigationControllerBaseViewBackgroundColor
	}
	public static var tabBarControllerBaseViewBackgroundColor: UIColor {
		return App.style.tabBarControllerBaseViewBackgroundColor
	}
	public static var pagingViewControllerBaseViewBackgroundColor: UIColor {
		return App.style.pagingViewControllerBaseViewBackgroundColor
	}
	public static var formViewControllerBackgroundColor: UIColor {
		return App.style.formViewControllerBackgroundColor
	}
}

// MARK: Non-appearance protocol default customizations
//
//public extension UITableViewController {
//
//	open override func viewDidLoad() {
//		super.viewDidLoad()
//		tableView.apply(tableViewStyle: .defaultStyle)
//	}
//
//}
//
//public extension UICollectionViewController {
//
//	open override func viewDidLoad() {
//		super.viewDidLoad()
//		collectionView?.apply(collectionViewStyle: .defaultStyle)
//	}
//}
//
//
//public extension UITableViewCell{
//	open override func awakeFromNib() {
//		super.awakeFromNib()
//		self.apply(tableViewCellStyle: .defaultStyle)
//	}
//}
