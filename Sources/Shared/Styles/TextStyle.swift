//
//  TextStyle.swift
//  Pods
//
//  Created by Brian Strobach on 3/17/17.
//
//

import UIKit

public protocol TextStyleable {
    func apply(textStyle: TextStyle)
}


extension Collection where Element: TextStyleable {
    public func apply(textStyle: TextStyle) {
        for item in self {
            item.apply(textStyle: textStyle)
        }
    }
}

open class TextStyle: Style {
    open var color: UIColor
    open var font: UIFont
    open var shadowStyle: ShadowStyle?
    
    public init(color: UIColor, font: UIFont, shadowStyle: ShadowStyle? = nil) {
        self.color = color
        self.font = font
        self.shadowStyle = shadowStyle
    }
    
    public func copy() -> TextStyle {
        return TextStyle(color: color, font: font, shadowStyle: shadowStyle)
    }
    
    public var attributeDictionary: [NSAttributedString.Key: Any] {
        var attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        if let shadowStyle = shadowStyle {
            attributes.merge(with: shadowStyle.attributeDictionary)
        }
        return attributes   
    }

    public func set(fontSize: CGFloat) -> Self {
        font = font.withSize(fontSize)
        return self
    }

    public func adjustFontSize(byPointSize pointSize: CGFloat) -> Self {
        font = font.withSize(font.pointSize + pointSize)
        return self
    }

    public func adjustFontSize(byMultiplier multiplier: CGFloat) -> Self {
        font = font.withSize(font.pointSize * multiplier)
        return self
    }

    public func with(fontSize: CGFloat) -> TextStyle {
        return self.copy().set(fontSize: fontSize)
    }

    public func withFontSize(adjustedBy pointSize: CGFloat) -> TextStyle {
        return self.copy().adjustFontSize(byPointSize: pointSize)
    }

    public func withFontSize(adjustedByMultiplier  multiplier: CGFloat) -> TextStyle {
        return self.copy().adjustFontSize(byMultiplier: multiplier)
    }
}
extension UILabel: TextStyleable {}
public extension UILabel {
    func apply(textStyle: TextStyle) {
        font = textStyle.font
        textColor = textStyle.color
        guard let shadowStyle = textStyle.shadowStyle else { return }
        self.apply(shadowStyle: shadowStyle)
    }
    
    func textStyle() -> TextStyle {        
        return TextStyle(color: textColor, font: font, shadowStyle: shadowStyle())
    }
    
}
extension UITextField: TextStyleable {}
public extension UITextField {
    func apply(textStyle: TextStyle) {
        font = textStyle.font
        textColor = textStyle.color
        guard let shadowStyle = textStyle.shadowStyle else { return }
        self.apply(shadowStyle: shadowStyle)
    }
}

extension UITextView: TextStyleable {}
public extension UITextView {
    func apply(textStyle: TextStyle) {
        font = textStyle.font
        textColor = textStyle.color
        guard let shadowStyle = textStyle.shadowStyle else { return }
        self.apply(shadowStyle: shadowStyle)
    }
}

extension UIButton: TextStyleable {}
public extension UIButton {
    func apply(textStyle: TextStyle) {
        setTitleColor(textStyle.color, for: .normal)
        titleLabel?.font = textStyle.font
        guard let shadow = textStyle.shadowStyle else {
            return
        }
        titleLabel?.apply(shadowStyle: shadow)
    }
}

extension UIBarButtonItem: TextStyleable {}
public extension UIBarButtonItem {
    func apply(textStyle: TextStyle) {
        setTitleTextAttributes(textStyle.attributeDictionary, for: .normal)
    }
    
    func apply(textStyle: TextStyle, for state: UIControl.State) {
        setTitleTextAttributes(textStyle.attributeDictionary, for: state)
    }
}

extension Array where Element: TextStyleable {
    public func apply(textStyle: TextStyle) {
        forEach({$0.apply(textStyle: textStyle)})
    }
}
