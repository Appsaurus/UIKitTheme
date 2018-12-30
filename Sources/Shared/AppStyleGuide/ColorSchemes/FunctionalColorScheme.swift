//
//  FunctionalColorScheme.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit
import DynamicColor

open class FunctionalColorScheme: DefaultOverridable {
	//Indicator colors
	open var cancel: UIColor = FlatColors.red
	open var delete: UIColor = FlatColors.red
	open var deselected: UIColor = FlatColors.grayDark
	open var disabled: UIColor = FlatColors.gray
	open var error: UIColor = FlatColors.red
	open var notify: UIColor = FlatColors.red
	open var selected: UIColor = FlatColors.blue
	open var submit: UIColor = FlatColors.blue
	open var success: UIColor = FlatColors.green
	open var warning: UIColor = FlatColors.yellow

    public required init() {
        overrideDefaults()
    }
    
    open func overrideStoredDefaults() {
        
    }
    
    open func overrideDerivedDefaults() {
        
    }
}

extension FunctionalColorScheme: ColorPaletteProvider {
	public var colors: [UIColor] {
		return [
			cancel,
			delete,
			deselected,
			disabled,
			error,
			notify,
			selected,
			submit,
			success,
			warning
		]
	}
}

extension UIColor {

	//Functional
	public static var cancel: UIColor { return App.colors.functional.cancel }
	public static var delete: UIColor { return App.colors.functional.delete }
	public static var deselected: UIColor { return App.colors.functional.deselected }
	public static var disabled: UIColor { return App.colors.functional.disabled }
	public static var error: UIColor { return App.colors.functional.error }
	public static var notify: UIColor { return App.colors.functional.notify }
	public static var selected: UIColor { return App.colors.functional.selected }
	public static var submit: UIColor { return App.colors.functional.submit }
	public static var success: UIColor { return App.colors.functional.success }
	public static var warning: UIColor { return App.colors.functional.warning }
}
