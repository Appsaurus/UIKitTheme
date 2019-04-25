//
//  TypographyGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class FontSizingGuide: DefaultOverridable {
    open var barButton: CGFloat = 17.0
    open var button: CGFloat = UIFont.buttonFontSize
    open var label: CGFloat = UIFont.labelFontSize
    open var navigationBarTitle: CGFloat = 17.0
    open var smallSystem: CGFloat = UIFont.smallSystemFontSize
    open var system: CGFloat = UIFont.systemFontSize
    open var icon: CGFloat = 50.0
    
    public required init() {
        overrideDefaults()
    }
    
    open func overrideStoredDefaults() {
        
    }
    
    open func overrideDerivedDefaults() {
        
    }
}

open class TypographyGuide: DefaultOverridable {
    open lazy var sizes: FontSizingGuide = FontSizingGuide()
    open lazy var displayFont: FontGuide = FontGuide()
    open lazy var font: FontGuide = FontGuide()

    public required init() {
        overrideDefaults()
    }
    
    open func overrideStoredDefaults() {
        
    }
    
    open func overrideDerivedDefaults() {
        
    }
}
open class FontGuide: DefaultOverridable {

    // MARK: Fonts Names
    open var ultraLightName: String?
    open var thinName: String?
    open var lightName: String?
    open var regularName: String?
    open var mediumName: String?
    open var semiboldName: String?
    open var boldName: String?
    open var heavyName: String?
    open var blackName: String?


    // MARK: Custom Dynamic Type Font Names
    open var title1Name: String?
    open var title2Name: String?
    open var title3Name: String?
    open var headlineName: String?
    open var bodyName: String?
    open var calloutName: String?
    open var subheadlineName: String?
    open var footnoteName: String?
    open var caption1Name: String?
    open var caption2Name: String?

    public required init() {
        overrideDefaults()
        loadCustomFonts()
    }

    open func overrideStoredDefaults() {}
    open func overrideDerivedDefaults() {}
    open func loadCustomFonts() {} //If you want to manually load custom fonts, do it here.

    open func iconFont(_ size: CGFloat? = nil) -> UIFont {
        assertionFailure(String(describing: self) + " is abstract. You must implement " + #function)
        return regular(size ?? .icon)
    }

    open func font(weight: UIFont.Weight, size: CGFloat = .system) -> UIFont {
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

    open func ultraLight(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .ultraLight, size: size)
    }

    open func thin(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .thin, size: size)
    }

    open func light(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .light, size: size)
    }

    open func regular(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .regular, size: size)
    }

    open func medium(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .medium, size: size)
    }

    open func semibold(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .semibold, size: size)
    }

    open func bold(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .bold, size: size)
    }

    open func heavy(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .heavy, size: size)
    }

    open func black(_ size: CGFloat = .system) -> UIFont {
        return font(weight: .black, size: size)
    }

    @available(iOS 11.0, *)
    open func largeTitle(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .largeTitle)
    }

    open func title1(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .title1)
    }

    open func title2(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .title2)
    }

    open func title3(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .title3)
    }

    open func headline(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .headline)
    }

    open func body(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .body)
    }

    open func callout(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .callout)
    }

    open func subheadline(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .subheadline)
    }

    open func footnote(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .footnote)
    }

    open func caption1(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .caption1)
    }

    open func caption2(font: UIFont? = nil) -> UIFont {
        return dynamic(font: font, textStyle: .caption2)
    }

    open func dynamic(font: UIFont? = nil, textStyle: UIFont.TextStyle) -> UIFont {
        var font = font
        if font == nil, let dynamicFontName = fontName(textStyle: textStyle) {
            font = UIFont(name: dynamicFontName, size: .system)
        }
        guard #available(iOS 11.0, *), let customFont = font else { return .preferredFont(forTextStyle: textStyle) }
        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: customFont)
    }

    // MARK: Custom Dynamic Type Font Overrides
}

extension FontGuide {

    public func fontName(weight: UIFont.Weight) -> String? {
        switch weight {
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

    public func fontName(textStyle: UIFont.TextStyle) -> String? {
        switch textStyle {
        case .title1: return title1Name
        case .title2: return title2Name
        case .title3: return title3Name
        case .headline: return headlineName
        case .body: return bodyName
        case .callout: return calloutName
        case .subheadline: return subheadlineName
        case .footnote: return footnoteName
        case .caption1: return caption1Name
        case .caption2: return caption2Name
        default: return nil
        }
    }
}


// MARK: Convenience Extensions

extension UIFont {

    public static func ultraLight(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.ultraLight(size)
    }

    public static func thin(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.thin(size)
    }

    public static func light(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.light(size)
    }

    public static func regular(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.regular(size)
    }

    public static func medium(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.medium(size)
    }

    public static func semibold(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.semibold(size)
    }

    public static func bold(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.bold(size)
    }

    public static func heavy(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.heavy(size)
    }

    public static func black(_ size: CGFloat = .system) -> UIFont {
        return App.style.font.black(size)
    }
}

// MARK: Dynamic Type Support
extension UIFont {
    @available(iOS 11.0, *)
    public static var largeTitle: UIFont {
        return App.style.font.largeTitle()
    }

    public static var title1: UIFont {
        return App.style.font.title1()
    }

    public static var title2: UIFont {
        return App.style.font.title2()
    }

    public static var title3: UIFont {
        return App.style.font.title3()
    }

    public static var headline: UIFont {
        return App.style.font.headline()
    }

    public static var body: UIFont {
        return App.style.font.body()
    }

    public static var callout: UIFont {
        return App.style.font.callout()
    }

    public static var subheadline: UIFont {
        return App.style.font.subheadline()
    }

    public static var footnote: UIFont {
        return App.style.font.footnote()
    }

    public static var caption1: UIFont {
        return App.style.font.caption1()
    }

    public static var caption2: UIFont {
        return App.style.font.caption2()
    }

    //MARK: Display Font
    @available(iOS 11.0, *)
    public static var displayLargeTitle: UIFont {
        return App.style.displayFont.largeTitle()
    }

    public static var displayTitle1: UIFont {
        return App.style.displayFont.title1()
    }

    public static var displayTitle2: UIFont {
        return App.style.displayFont.title2()
    }

    public static var displayTitle3: UIFont {
        return App.style.displayFont.title3()
    }

    public static var displayHeadline: UIFont {
        return App.style.displayFont.headline()
    }

    public static var displayBody: UIFont {
        return App.style.displayFont.body()
    }

    public static var displayCallout: UIFont {
        return App.style.displayFont.callout()
    }

    public static var displaySubheadline: UIFont {
        return App.style.displayFont.subheadline()
    }

    public static var displayFootnote: UIFont {
        return App.style.displayFont.footnote()
    }

    public static var displayCaption1: UIFont {
        return App.style.displayFont.caption1()
    }

    public static var displayCaption2: UIFont {
        return App.style.displayFont.caption2()
    }
}

extension CGFloat {
    public static var barButton: CGFloat { return  App.style.fontSizes.barButton }
    public static var button: CGFloat { return App.style.fontSizes.button }
    public static var icon: CGFloat { return App.style.fontSizes.icon }
    public static var label: CGFloat { return  App.style.fontSizes.label }
    public static var navigationBarTitle: CGFloat { return  App.style.fontSizes.navigationBarTitle }
    public static var smallSystem: CGFloat { return App.style.fontSizes.smallSystem }
    public static var system: CGFloat { return App.style.fontSizes.system }
}
