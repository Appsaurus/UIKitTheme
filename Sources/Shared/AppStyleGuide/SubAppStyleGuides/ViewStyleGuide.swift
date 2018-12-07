//
//  ViewStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import Foundation
import UIKit
//import DynamicColor

open class ViewStyleGuideDefaults: SubAppStyleGuideDefaults{
	open var roundedRectCornerRadius: CGFloat = 3.0
	open lazy var solidBackgroundColor: UIColor = colors.neutrals.light
	open lazy var cardBackgroundColor: UIColor = solidBackgroundColor

	open lazy var outlinedBackgroundColor: UIColor? = nil
	open var outlineBorderWidth: CGFloat = 1.0
	open lazy var outlinedBorderColor: UIColor = colors.primary
	
	open var cardShape: ViewShape = .square
	open var raisedShape: ViewShape = .square
}

open class ViewStyleGuide: SubAppStyleGuide, DefaultSettingsManaged{
	public typealias Defaults = ViewStyleGuideDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)

	open func card(backgroundColor: UIColor? = nil, borderStyle: BorderStyle? = nil, shadowColor: UIColor? = nil, shape: ViewShape? = nil) -> ViewStyle{
		return ViewStyle(backgroundColor: backgroundColor ?? defaults.cardBackgroundColor,
						 borderStyle: borderStyle,
						 shadowStyle: .card(shadowColor),
						 shape: shape ?? defaults.cardShape)
	}

	open func raised(backgroundColor: UIColor? = nil, borderStyle: BorderStyle? = nil, shadowColor: UIColor? = nil, shape: ViewShape? = nil) -> ViewStyle{
		return ViewStyle(backgroundColor: backgroundColor ?? defaults.solidBackgroundColor,
						 borderStyle: borderStyle,
						 shadowStyle: .raised(shadowColor),
						 shape: shape ?? defaults.raisedShape)
	}
	
	open func round(backgroundColor: UIColor? = nil,
					borderStyle: BorderStyle? = nil,
					shadowStyle: ShadowStyle? = nil) -> ViewStyle{
		let backgroundColor = backgroundColor ?? defaults.solidBackgroundColor
		return ViewStyle(backgroundColor: backgroundColor, borderStyle: borderStyle, shadowStyle: shadowStyle, shape: .rounded)
	}
	
	open func roundedRect(backgroundColor: UIColor? = nil,
						  borderStyle: BorderStyle? = nil,
						  shadowStyle: ShadowStyle? = nil,
						  cornerRadius: CGFloat? = nil) -> ViewStyle{
		let backgroundColor = backgroundColor ?? defaults.solidBackgroundColor
		let viewStyle = ViewStyle(backgroundColor: backgroundColor, borderStyle: borderStyle, shadowStyle: shadowStyle, shape: .roundedRect)
		return viewStyle
	}
	
	open func solid(backgroundColor: UIColor? = nil,
					borderStyle: BorderStyle? = nil,
					shadowStyle: ShadowStyle? = nil,
					shape: ViewShape = .square) -> ViewStyle{
		let backgroundColor = backgroundColor ?? defaults.solidBackgroundColor
		return ViewStyle(backgroundColor: backgroundColor, borderStyle: borderStyle, shadowStyle: shadowStyle, shape: shape)
	}
	
	open func outlined( backgroundColor: UIColor? = nil,
						borderColor: UIColor? = nil,
						borderWidth: CGFloat = 1.0,
						shadowStyle: ShadowStyle? = nil,
						shape: ViewShape = .square) -> ViewStyle{
		let backgroundColor = backgroundColor ?? defaults.outlinedBackgroundColor
		let borderStyle = BorderStyle(borderColor: borderColor, borderWidth: borderWidth)
		return ViewStyle(backgroundColor: backgroundColor, borderStyle: borderStyle, shadowStyle: shadowStyle, shape: shape)
	}
	
}

//MARK: Convenience Extensions
//Make it easy to access functions from current style guide inside method signatures at call site.

extension ViewStyle{
	
	public static var clear: ViewStyle{
		return ViewStyle(backgroundColor: .clear)
	}

	public static var card: ViewStyle{
		return card()
	}

	public static func card(backgroundColor: UIColor? = nil, borderStyle: BorderStyle? = nil, shadowColor: UIColor? = nil, shape: ViewShape? = nil) -> ViewStyle{
		return App.style.views.card(backgroundColor: backgroundColor,
									borderStyle: borderStyle,
									shadowColor: shadowColor,
									shape: shape)
	}


	public static var raised: ViewStyle{
		return raised()
	}

	public static func raised(backgroundColor: UIColor? = nil, borderStyle: BorderStyle? = nil, shadowColor: UIColor? = nil, shape: ViewShape? = nil) -> ViewStyle{
		return App.style.views.raised(backgroundColor: backgroundColor,
									  borderStyle: borderStyle,
									  shadowColor: shadowColor,
									  shape: shape)
	}

	public static var round: ViewStyle{
		return round()
	}

	public static func round(backgroundColor: UIColor? = nil,
							 borderStyle: BorderStyle? = nil,
							 shadowStyle: ShadowStyle? = nil) -> ViewStyle{
		return App.style.views.round(backgroundColor: backgroundColor,
									 borderStyle: borderStyle,
									 shadowStyle: shadowStyle)
	}

	public static var roundedRect: ViewStyle{
		return roundedRect()
	}
	public static func roundedRect(backgroundColor: UIColor? = nil,
								   borderStyle: BorderStyle? = nil,
								   shadowStyle: ShadowStyle? = nil,
								   cornerRadius: CGFloat? = nil) -> ViewStyle{
		return App.style.views.roundedRect(backgroundColor: backgroundColor,
										   borderStyle: borderStyle,
										   shadowStyle: shadowStyle,
										   cornerRadius: cornerRadius)
	}

	public static var solid: ViewStyle{
		return solid()
	}
	public static func solid(backgroundColor: UIColor? = nil,
							 borderStyle: BorderStyle? = nil,
							 shadowStyle: ShadowStyle? = nil,
							 shape: ViewShape = .square) -> ViewStyle{
		return App.style.views.solid(backgroundColor: backgroundColor,
									 borderStyle: borderStyle,
									 shadowStyle: shadowStyle,
									 shape: shape)
	}
	
	public static func outlined( backgroundColor: UIColor? = nil,
								 borderColor: UIColor? = nil,
								 borderWidth: CGFloat = 1.0,
								 shadowStyle: ShadowStyle? = nil,
								 shape: ViewShape = .square) -> ViewStyle{
		return App.style.views.outlined(backgroundColor: backgroundColor,
										borderColor: borderColor,
										borderWidth: borderWidth,
										shadowStyle: shadowStyle,
										shape: shape)
	}
}
