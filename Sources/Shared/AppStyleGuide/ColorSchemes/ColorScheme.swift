//
//  ColorScheme.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit
import DynamicColor

open class ColorScheme: DefaultOverridable{
	//Main color. Default for elements like window backgrounds, navigation bars, etc.
	open var primary: UIColor = FlatColors.skyBlue
	open var secondary: UIColor = FlatColors.red
	open var tertiary: UIColor = FlatColors.sand

	open lazy var primaryContrast: UIColor = [secondary, tertiary, primaryComplement, FlatColors.white].firstContrasting(with: primary) ?? FlatColors.black
	open lazy var primaryComplement: UIColor = primary.complemented().flattened()
	open lazy var primaryDark: UIColor = primary.darkened().flattened()
	open lazy var primaryLight: UIColor = primary.lighter().flattened()

	open lazy var neutrals: NeutralColorScheme = NeutralColorScheme()
	open lazy var text: NeutralTextColorScheme = NeutralTextColorScheme()
	open lazy var functional: FunctionalColorScheme = FunctionalColorScheme()

	public required init(){
        overrideDefaults()
    }
    
    open func overrideStoredDefaults(){
        
    }
    
    open func overrideDerivedDefaults(){
        
    }
}

extension ColorPaletteProvider{
	public func colorContrasting(_ color: UIColor,
								 inContext context: DynamicColor.ContrastDisplayContext = .standard,
								 rank: RelativeContrastRank = .max) -> UIColor{
		return color.contrastingColor(inContext: context, rank: rank, fromCandidates: colors)
	}
}

extension ColorScheme : ColorPaletteProvider{
	public var colors: [UIColor]{
		return [
			primary,
			secondary,
			tertiary,
			primaryContrast,
			primaryDark,
			primaryLight
		]
	}
}
//MARK: Conevenience extensions

extension UIColor{
	public static var primary: UIColor { return App.colors.primary }
	public static var secondary: UIColor { return App.colors.secondary }
	public static var tertiary: UIColor { return App.colors.tertiary }

	public static var primaryContrast: UIColor { return App.colors.primaryContrast }
	public static var primaryComplement: UIColor { return App.colors.primaryComplement }
	public static var primaryDark: UIColor { return App.colors.primaryDark }
	public static var primaryLight: UIColor { return App.colors.primaryLight }

}
