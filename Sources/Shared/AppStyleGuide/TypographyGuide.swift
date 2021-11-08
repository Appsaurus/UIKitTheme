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
    open var largeTitleName: String?
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
    open func largeTitle(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .largeTitle, dynamic: dynamic)
    }

    open func title1(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .title1, dynamic: dynamic)
    }

    open func title2(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .title2, dynamic: dynamic)
    }

    open func title3(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .title3, dynamic: dynamic)
    }

    open func headline(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .headline, dynamic: dynamic)
    }

    open func body(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .body, dynamic: dynamic)
    }

    open func callout(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .callout, dynamic: dynamic)
    }

    open func subheadline(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .subheadline, dynamic: dynamic)
    }

    open func footnote(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .footnote, dynamic: dynamic)
    }

    open func caption1(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .caption1, dynamic: dynamic)
    }

    open func caption2(font: UIFont? = nil, dynamic: Bool = false) -> UIFont {
        return resolveFont(font: font, textStyle: .caption2, dynamic: dynamic)
    }

    open func resolveFont(font: UIFont? = nil, textStyle: UIFont.TextStyle, dynamic: Bool = false) -> UIFont {
        var font = font
        var preferredFont = UIFont.preferredFont(forTextStyle: textStyle)
        if #available(iOS 10.0, *) {
            if !dynamic {
                preferredFont = UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: .defaultContentSizeTraitCollection)
            }
        }
        if font == nil, let dynamicFontName = fontName(textStyle: textStyle) {
            font = UIFont(name: dynamicFontName, size: preferredFont.pointSize)
        }
        return font ?? preferredFont
        //        guard #available(iOS 11.0, *), let customFont = font else { return preferredFont }
        //        return UIFontMetrics(forTextStyle: textStyle).scaledFont(for: customFont)
    }

    @available(iOS 10.0, *)
    open func nonDynamic(font: UIFont? = nil, textStyle: UIFont.TextStyle) -> UIFont {
        var font = font
        let preferredFont = UIFont.preferredFont(forTextStyle: textStyle, compatibleWith: .defaultContentSizeTraitCollection)
        if font == nil, let dynamicFontName = fontName(textStyle: textStyle) {
            font = UIFont(name: dynamicFontName, size: preferredFont.pointSize)
        }
        return font ?? preferredFont
    }
}

@available(iOS 10.0, *)
public extension UITraitCollection {
    /// A trait collection containing the default content size category used
    /// when the system does not have a modified type size set.
    static let defaultContentSizeTraitCollection = UITraitCollection(preferredContentSizeCategory: .large)
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
        if #available(iOS 11.0, *) {
            switch textStyle {
            case .largeTitle: return largeTitleName
            default: break
            }
        }

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
        default: return title1Name
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

extension UIFont {

    public static func displayUltralight(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.ultraLight(size)
    }

    public static func displayThin(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.thin(size)
    }

    public static func displayLight(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.light(size)
    }

    public static func displayRegular(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.regular(size)
    }

    public static func displayMedium(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.medium(size)
    }

    public static func displaySemibold(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.semibold(size)
    }

    public static func displayBold(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.bold(size)
    }

    public static func displayHeavy(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.heavy(size)
    }

    public static func displayBlack(_ size: CGFloat = .system) -> UIFont {
        return App.style.displayFont.black(size)
    }
}

// MARK: Dynamic Type Support
extension UIFont {
    @available(iOS 11.0, *)
    public static func largeTitle(dynamic: Bool = false) -> UIFont {
        return App.style.font.largeTitle(dynamic: dynamic)
    }

    public static func title1(dynamic: Bool = false) -> UIFont {
        return App.style.font.title1(dynamic: dynamic)
    }

    public static func title2(dynamic: Bool = false) -> UIFont {
        return App.style.font.title2(dynamic: dynamic)
    }

    public static func title3(dynamic: Bool = false) -> UIFont {
        return App.style.font.title3(dynamic: dynamic)
    }

    public static func headline(dynamic: Bool = false) -> UIFont {
        return App.style.font.headline(dynamic: dynamic)
    }

    public static func body(dynamic: Bool = false) -> UIFont {
        return App.style.font.body(dynamic: dynamic)
    }

    public static func callout(dynamic: Bool = false) -> UIFont {
        return App.style.font.callout(dynamic: dynamic)
    }

    public static func subheadline(dynamic: Bool = false) -> UIFont {
        return App.style.font.subheadline(dynamic: dynamic)
    }

    public static func footnote(dynamic: Bool = false) -> UIFont {
        return App.style.font.footnote(dynamic: dynamic)
    }

    public static func caption1(dynamic: Bool = false) -> UIFont {
        return App.style.font.caption1(dynamic: dynamic)
    }

    public static func caption2(dynamic: Bool = false) -> UIFont {
        return App.style.font.caption2(dynamic: dynamic)
    }

    // MARK: Display Font
    @available(iOS 11.0, *)
    public static func displayLargeTitle(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.largeTitle(dynamic: dynamic)
    }

    public static func displayTitle1(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.title1(dynamic: dynamic)
    }

    public static func displayTitle2(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.title2(dynamic: dynamic)
    }

    public static func displayTitle3(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.title3(dynamic: dynamic)
    }

    public static func displayHeadline(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.headline(dynamic: dynamic)
    }

    public static func displayBody(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.body(dynamic: dynamic)
    }

    public static func displayCallout(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.callout(dynamic: dynamic)
    }

    public static func displaySubheadline(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.subheadline(dynamic: dynamic)
    }

    public static func displayFootnote(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.footnote(dynamic: dynamic)
    }

    public static func displayCaption1(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.caption1(dynamic: dynamic)
    }

    public static func displayCaption2(dynamic: Bool = false) -> UIFont {
        return App.style.displayFont.caption2(dynamic: dynamic)
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
