//
//  ViewStyle.swift
//  Pods
//
//  Created by Brian Strobach on 3/19/17.
//
//

import UIKitExtensions

open class Style {
    open class var s: AppStyleGuide {
        return App.style
    }

    public init() {}
}

public enum ViewShape {
	public static var roundedRectCornerRadius: CGFloat = 2.0
	case square
	case rounded
	case roundedRect
	case custom(cornerRadius: CGFloat)
}

open class ViewStyle: Style {
    open var backgroundColor: UIColor?
    open var borderStyle: BorderStyle?
    open var shadowStyle: ShadowStyle?
	open var shape: ViewShape
    
	public init(backgroundColor: UIColor? = nil, borderStyle: BorderStyle? = nil, shadowStyle: ShadowStyle? = nil, shape: ViewShape = .square) {
        self.backgroundColor = backgroundColor
        self.borderStyle = borderStyle
        self.shadowStyle = shadowStyle
		self.shape = shape
    }
}

public protocol ViewStyleable {
    func apply(viewStyle style: ViewStyle, optimizeRendering: Bool)
}
extension UIView: ViewStyleable {
    public func viewStyle() -> ViewStyle {
        return ViewStyle(backgroundColor: backgroundColor, borderStyle: self.borderStyle_(), shadowStyle: self.shadowStyle())
    }
    public func apply(viewStyle style: ViewStyle, optimizeRendering: Bool = true) {
        backgroundColor = style.backgroundColor
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
            (self as? Roundable)?.rounded = true
            roundCorners()
		}
	}
}
