//
//  TextStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class TextStyleGuide: SubAppStyleGuide{
	open func ultraLight(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.ultraLight(size))
	}
	
	open func thin(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
        let color = color ?? colors.text.defaultText
		return style(color: color, font: fonts.thin(size))
	}
	
	open func light(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.light(size))
	}
	
	open func regular(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.regular(size))
	}
	
	open func medium(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.medium(size))
	}
	
	open func semibold(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.semibold(size))
	}
	
	open func bold(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.bold(size))
	}
	
	open func heavy(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.heavy(size))
	}
	
	open func black(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle{
		return style(color: color, font: fonts.black(size))
	}
	private func style(color: UIColor? = nil, font: UIFont) -> TextStyle{
        let color = color ?? colors.text.defaultText
		return TextStyle(color: color, font: font)
	}
}


extension TextStyle{
    public static func ultraLight(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle{
		return App.style.text.ultraLight(color: color, size: size)
	}
	
    public static func light(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle{
		return App.style.text.light(color: color, size: size)
	}
	
    public static func regular(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle{
		return App.style.text.regular(color: color, size: size)
	}
	
    public static func medium(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle{
		return App.style.text.medium(color: color, size: size)
	}
	
    public static func semibold(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle{
		return App.style.text.semibold(color: color, size: size)
	}
	
    public static func bold(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle{
		return App.style.text.bold(color: color, size: size)
	}
}
