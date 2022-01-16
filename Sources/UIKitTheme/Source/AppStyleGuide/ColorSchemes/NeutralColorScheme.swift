//
//  NeutralColorScheme.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class NeutralColorScheme: DefaultOverridable {
	open var light: UIColor = FlatColors.white
	open var mediumLight: UIColor = FlatColors.whiteDark
	open var medium: UIColor = FlatColors.gray
	open var mediumDark: UIColor = FlatColors.grayDark
	open var dark: UIColor = FlatColors.black

    public required init() {
        overrideDefaults()
    }
    
    open func overrideStoredDefaults() {
        
    }
    
    open func overrideDerivedDefaults() {
        
    }
}

extension NeutralColorScheme: ColorPaletteProvider {
	public var colors: [UIColor] {
		return [
			light,
			mediumLight,
			medium,
			mediumDark,
			dark
		]
	}
}

extension UIColor {

	public static var neutralLight: UIColor { return App.colors.neutrals.light }
	public static var neutralMediumLight: UIColor { return App.colors.neutrals.mediumLight }
	public static var neutralMedium: UIColor { return App.colors.neutrals.medium }
	public static var neutralMediumDark: UIColor { return App.colors.neutrals.mediumDark }
	public static var neutralDark: UIColor { return App.colors.neutrals.dark }

}
