//
//  ShadowStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/13/18.
//

import Foundation
import UIKit
//import DynamicColor

open class ShadowStyleGuideDefaults: SubAppStyleGuideDefaults{
	open lazy var color: UIColor = colors.neutrals.mediumLight
}

open class ShadowStyleGuide: SubAppStyleGuide, DefaultSettingsManaged{
	public typealias Defaults = ShadowStyleGuideDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)


	open var raised: ShadowStyle{
		return raised(defaults.color)
	}

	open func raised(_ color: UIColor? = nil) -> ShadowStyle{
		return ShadowStyle(shadowColor: color ?? defaults.color,
						   shadowOffset: CGSize(width: 0.0, height: 1.25),
						   shadowOpacity: 0.6,
						   shadowRadius: 1.0)
	}

	open var card: ShadowStyle{
		return card(defaults.color)
	}

	open func card(_ color: UIColor? = nil) -> ShadowStyle{
		return ShadowStyle(shadowColor: color ?? defaults.color,
						   shadowOffset: CGSize(width: 0.0, height: 1.25),
						   shadowOpacity: 0.6,
						   shadowRadius: 1.0)
	}
}

extension ShadowStyle{
	public static var flat: ShadowStyle{
		return ShadowStyle(shadowColor:  nil,
						   shadowOffset: CGSize(width: 0.0, height: 0.0),
						   shadowOpacity: 0.0,
						   shadowRadius: 0.0)
	}

	public static var raised: ShadowStyle{
		return App.style.shadows.raised
	}

	public static func raised(_ color: UIColor? = nil) -> ShadowStyle{
		return App.style.shadows.raised(color)
	}

	public static var card: ShadowStyle{
		return App.style.shadows.card
	}

	public static func card(_ color: UIColor? = nil) -> ShadowStyle{
		return App.style.shadows.card(color)
	}
}
