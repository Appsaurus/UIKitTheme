//
//  TypographyGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class FontSizingGuide: DefaultOverridable{
	open var barButton: CGFloat = 17.0
	open var button: CGFloat = UIFont.buttonFontSize
	open var label: CGFloat = UIFont.labelFontSize
	open var navigationBarTitle: CGFloat = 17.0
	open var smallSystem: CGFloat = UIFont.smallSystemFontSize
	open var system: CGFloat = UIFont.systemFontSize
	open var icon: CGFloat = 50.0
    
    public required init(){
        overrideDefaults()
    }
    
    open func overrideStoredDefaults(){
        
    }
    
    open func overrideDerivedDefaults(){
        
    }
}


open class TypographyGuide: DefaultOverridable{
	open lazy var sizes: FontSizingGuide = FontSizingGuide()
	open lazy var fonts: FontGuide = FontGuide()

    public required init(){
        overrideDefaults()
    }
    
    open func overrideStoredDefaults(){
        
    }
    
    open func overrideDerivedDefaults(){
        
    }
}
open class FontGuide: DefaultOverridable{

    //MARK: Fonts Names
    open var ultraLightName: String?
    open var thinName: String?
    open var lightName: String?
    open var regularName: String?
    open var mediumName: String?
    open var semiboldName: String?
    open var boldName: String?
    open var heavyName: String?
    open var blackName: String?
    
    public required init(){
        overrideDerivedDefaults()
        loadCustomFonts()
    }
    
    open func overrideStoredDefaults(){
        
    }
    
    open func overrideDerivedDefaults(){
        
    }



	//MARK: Fonts

	public func fontName(weight: UIFont.Weight) -> String?{
		switch weight{
		case .ultraLight: return ultraLightName
		case .thin: return thinName
		case .light: return lightName
		case .regular: return regularName
		case .medium: return mediumName
		case .semibold: return semiboldName
		case .bold: return boldName
		case .heavy: return heavyName
		default: return nil
		}
	}

	open func iconFont(_ size: CGFloat? = nil) -> UIFont{
		assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
		return regular(size ?? .icon)
	}

	open func font(weight: UIFont.Weight, size: CGFloat = .system) -> UIFont{
		guard let fontName = fontName(weight: weight) else {
//			debugPrint("No font name set for weight \(weight). Using system font instead.")
			return UIFont.systemFont(ofSize: size, weight: weight)
		}
		guard let font = UIFont(name: fontName, size: size) else {
			debugPrint("Unable to load font named \(fontName). Using system font instead.")
			return UIFont.systemFont(ofSize: size, weight: weight)
		}
		return font
	}

	open func ultraLight(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .ultraLight, size: size)
	}

	open func thin(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .thin, size: size)
	}

	open func light(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .light, size: size)
	}

	open func regular(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .regular, size: size)
	}

	open func medium(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .medium, size: size)
	}

	open func semibold(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .semibold, size: size)
	}

	open func bold(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .bold, size: size)
	}

	open func heavy(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .heavy, size: size)
	}

	open func black(_ size: CGFloat = .system) -> UIFont{
		return font(weight: .black, size: size)
	}
}

extension FontGuide{
	
	open func loadCustomFonts(){
		
//		[ultraLightName,
//		 thinName,
//		 lightName,
//		 regularName,
//		 mediumName,
//		 semiboldName,
//		 boldName,
//		 heavyName,
//		 blackName].removeNils().forEach({FontLoader.loadFont($0)})
	}
}

//MARK: Convenience Extensions

extension UIFont{
	public static func ultraLight(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.ultraLight(size)
	}

	public static func thin(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.thin(size)
	}

	public static func light(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.light(size)
	}

	public static func regular(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.regular(size)
	}

	public static func medium(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.medium(size)
	}

	public static func semibold(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.semibold(size)
	}

	public static func bold(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.bold(size)
	}

	public static func heavy(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.heavy(size)
	}

	public static func black(_ size: CGFloat = .system) -> UIFont{
		return App.style.fonts.black(size)
	}
}

extension CGFloat{
	public static var barButton: CGFloat { return  App.style.fontSizes.barButton }
	public static var button: CGFloat { return App.style.fontSizes.button }
	public static var icon: CGFloat { return App.style.fontSizes.icon }
	public static var label: CGFloat { return  App.style.fontSizes.label }
	public static var navigationBarTitle: CGFloat { return  App.style.fontSizes.navigationBarTitle }
	public static var smallSystem: CGFloat { return App.style.fontSizes.smallSystem }
	public static var system: CGFloat { return App.style.fontSizes.system }
}
