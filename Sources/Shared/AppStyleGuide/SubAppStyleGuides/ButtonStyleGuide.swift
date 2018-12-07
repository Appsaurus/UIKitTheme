//
//  ButtonStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class ButtonStyleDefaults: SubAppStyleGuideDefaults{
	open var shape: ViewShape = .square
	open lazy var font: UIFont = fonts.semibold(.button)
	open lazy var backgroundColor: UIColor = colors.primary

	open lazy var flatTextColor: UIColor = colors.primary

	open var outlineBorderWidth: CGFloat = 1.0
	open lazy var outlinedBorderColor: UIColor = colors.primary
}

open class ButtonStyleGuide: SubAppStyleGuide, DefaultSettingsManaged{
	public typealias Defaults = ButtonStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open func round(backgroundColor: UIColor? = nil,
					textColor: UIColor? = nil,
					font: UIFont? = nil,
					borderStyle: BorderStyle? = nil,
					shadowStyle: ShadowStyle? = nil) -> ButtonStyle{
		let backgroundColor = backgroundColor ?? defaults.backgroundColor
		let textColor: UIColor = textColor ?? appStyleGuide.colors.text.colorContrasting(backgroundColor)
		let font = font ?? defaults.font
		let viewStyle = appStyleGuide.views.solid(backgroundColor: backgroundColor, borderStyle: borderStyle, shadowStyle: shadowStyle, shape: .rounded)
		return ButtonStyle(textStyle: TextStyle(color: textColor, font: font), viewStyle: viewStyle)

	}

	open func flat(textStyle: TextStyle? = nil) -> ButtonStyle{
        let textStyle = textStyle ?? TextStyle(color: defaults.flatTextColor, font: defaults.font)
		return ButtonStyle(textStyle: textStyle, viewStyle: .clear)
	}

	open func solid(backgroundColor: UIColor? = nil,
					textColor: UIColor? = nil,
					font: UIFont? = nil,
					borderStyle: BorderStyle? = nil,
					shadowStyle: ShadowStyle? = nil,
					shape: ViewShape? = nil) -> ButtonStyle{
		let backgroundColor = backgroundColor ?? defaults.backgroundColor
		let textColor: UIColor = textColor ?? appStyleGuide.colors.text.colorContrasting(backgroundColor)
		let font = font ?? defaults.font
		let shape = shape ?? defaults.shape
		let viewStyle = appStyleGuide.views.solid(backgroundColor: backgroundColor, borderStyle: borderStyle, shadowStyle: shadowStyle, shape: shape)
		return ButtonStyle(textStyle: TextStyle(color: textColor, font: font), viewStyle: viewStyle)
	}

	open func outlined(borderColor: UIColor? = nil,
					   borderWidth: CGFloat? = nil,
					   textColor: UIColor? = nil,
					   backgroundColor: UIColor = .clear,
					   font: UIFont? = nil,
					   shadowStyle: ShadowStyle? = nil,
					   shape: ViewShape? = nil) -> ButtonStyle{
		let borderColor = borderColor ?? defaults.outlinedBorderColor
		let borderWidth = borderWidth ?? defaults.outlineBorderWidth
		let textColor = textColor ?? borderColor
		let font = font ?? defaults.font
		let shape = shape ?? defaults.shape
		let borderStyle = BorderStyle(borderColor: borderColor, borderWidth: borderWidth)
		let viewStyle = ViewStyle(backgroundColor: backgroundColor, borderStyle: borderStyle, shadowStyle: shadowStyle, shape: shape)
		return ButtonStyle(textStyle: TextStyle(color: textColor, font: font), viewStyle: viewStyle)
	}

	open var barButtonItemStyle: ButtonStyle{
		return ButtonStyle(textStyle: .regular(color: .primaryContrast, size: .barButtonFontSize), viewStyle: .clear)
	}
}

//MARK: Convenience Extensions
//Make it easy to access functions from current style guide inside method signatures at call site.

extension ButtonStyle{
	public static func round(backgroundColor: UIColor? = nil,
							 textColor: UIColor? = nil,
							 font: UIFont? = nil,
							 borderStyle: BorderStyle? = nil,
							 shadowStyle: ShadowStyle? = nil) -> ButtonStyle{
		return App.style.buttons.round(backgroundColor: backgroundColor,
									   textColor: textColor,
									   font: font,
									   borderStyle: borderStyle,
									   shadowStyle: shadowStyle)

	}

	public static func flat(textStyle: TextStyle? = nil) -> ButtonStyle{
		return App.style.buttons.flat(textStyle: textStyle)
	}

	public static func solid(backgroundColor: UIColor? = nil,
							 textColor: UIColor? = nil,
							 font: UIFont? = nil,
							 borderStyle: BorderStyle? = nil,
							 shadowStyle: ShadowStyle? = nil,
							 shape: ViewShape? = nil) -> ButtonStyle{
		return App.style.buttons.solid(backgroundColor: backgroundColor,
									   textColor: textColor,
									   font: font,
									   borderStyle: borderStyle,
									   shadowStyle: shadowStyle,
									   shape: shape)
	}

	public static func outlined(borderColor: UIColor? = nil,
								borderWidth: CGFloat? = nil,
								textColor: UIColor? = nil,
								backgroundColor: UIColor = .clear,
								font: UIFont? = nil,
								shadowStyle: ShadowStyle? = nil,
								shape: ViewShape? = nil) -> ButtonStyle{
		return App.style.buttons.outlined(borderColor: borderColor,
										  borderWidth: borderWidth,
										  textColor: textColor,
										  backgroundColor: backgroundColor,
										  font: font,
										  shadowStyle: shadowStyle,
										  shape: shape)
	}

	public static var barButtonItemStyle: ButtonStyle{
		return App.style.buttons.barButtonItemStyle
	}

}
