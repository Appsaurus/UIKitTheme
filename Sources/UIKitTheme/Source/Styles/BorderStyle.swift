//
//  BorderStyle.swift
//  Pods
//
//  Created by Brian Strobach on 9/30/16.
//
//

import Foundation
import UIKit
import UIKitExtensions

open class BorderStyle: Style {
    open var borderColor: UIColor?
    open var borderWidth: CGFloat
    
    public init(borderColor: UIColor? = nil, borderWidth: CGFloat = 0.0) {
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}

public protocol BorderStyleable {
    func borderStyle_() -> BorderStyle
    func apply(borderStyle style: BorderStyle?)
}

extension UIView: BorderStyleable {
    
    public func borderStyle_() -> BorderStyle {
        return BorderStyle(borderColor: borderColor, borderWidth: borderWidth)
    }
    
    public func apply(borderStyle style: BorderStyle?) {
        guard let style = style else {
            layer.borderWidth = 0.0
            borderColor = nil
            return
        }
        borderWidth = style.borderWidth
        borderColor = style.borderColor
    }
}

extension CALayer: BorderStyleable {
    
    public func borderStyle_() -> BorderStyle {
        return BorderStyle(borderColor: borderColor?.uiColor, borderWidth: borderWidth)
    }
    
    public func apply(borderStyle style: BorderStyle?) {
        guard let style = style else {
            borderWidth = 0.0
            borderColor = nil
            return
        }
        borderWidth = style.borderWidth
        borderColor = style.borderColor?.cgColor
    }
}
public protocol ShadowStyleable {
    func apply(shadowStyle style: ShadowStyle, optimizeRendering: Bool)
    func shadowStyle() -> ShadowStyle?
    
}
extension CALayer: ShadowStyleable {
    
    public func apply(shadowStyle style: ShadowStyle, optimizeRendering: Bool = true) {
        shadowColor = style.shadowColor?.cgColor
        masksToBounds = shadowColor != nil && style.shadowOpacity > 0.0 ? false : true
        shadowOpacity = style.shadowOpacity
        shadowOffset = style.shadowOffset
        shadowRadius = style.shadowRadius
        
// Perrormance improvements for shadows
        //        if optimizeRendering{
        //            layer.shadowPath = UIBezierPath(rect:bounds).cgPath
        //            self.optimizeRendering()
        //        }
    }
    
    public func shadowStyle() -> ShadowStyle? {
        guard let shadowColor = shadowColor else { return nil }
        return ShadowStyle(shadowColor: UIColor(cgColor: shadowColor), shadowOffset: shadowOffset, shadowOpacity: shadowOpacity, shadowRadius: shadowRadius)
    }
    
}

extension CALayer: ViewStyleable {
    public func viewStyle() -> ViewStyle {
        return ViewStyle(backgroundColor: backgroundColor?.uiColor, borderStyle: self.borderStyle_(), shadowStyle: self.shadowStyle())
    }
    public func apply(viewStyle style: ViewStyle, optimizeRendering: Bool = true) {
        backgroundColor = style.backgroundColor?.cgColor
        apply(borderStyle: style.borderStyle)
        apply(shape: style.shape)
        guard let shadowStyle = style.shadowStyle else { return }
        apply(shadowStyle: shadowStyle)
    }
    
    public func apply(shape: ViewShape) {
        switch shape {
        case .square:
            cornerRadius = 0.0
        case .roundedRect:
            cornerRadius = ViewShape.roundedRectCornerRadius
        case .custom(let radius):
            cornerRadius = radius
        case .rounded:
            cornerRadius = self.frame.minSideLength/2.0
        }
    }
}
