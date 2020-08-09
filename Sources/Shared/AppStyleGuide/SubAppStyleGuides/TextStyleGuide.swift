//
//  TextStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class TextStyleGuide: SubAppStyleGuide {

	open func ultraLight(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.ultraLight(size))
	}
	
	open func thin(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
        let color = color ?? colors.text.defaultText
		return style(color: color, font: fonts.thin(size))
	}
	
	open func light(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.light(size))
	}
	
	open func regular(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.regular(size))
	}
	
	open func medium(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.medium(size))
	}
	
	open func semibold(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.semibold(size))
	}
	
	open func bold(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.bold(size))
	}
	
	open func heavy(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.heavy(size))
	}
	
	open func black(color: UIColor? = nil, size: CGFloat = .system) -> TextStyle {
		return style(color: color, font: fonts.black(size))
	}
	private func style(color: UIColor? = nil, font: UIFont) -> TextStyle {
        let color = color ?? colors.text.defaultText
		return TextStyle(color: color, font: font)
	}
}

extension TextStyle {
    public static func ultraLight(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle {
		return App.style.text.ultraLight(color: color, size: size)
	}
	
    public static func light(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle {
		return App.style.text.light(color: color, size: size)
	}
	
    public static func regular(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle {
		return App.style.text.regular(color: color, size: size)
	}
	
    public static func medium(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle {
		return App.style.text.medium(color: color, size: size)
	}
	
    public static func semibold(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle {
		return App.style.text.semibold(color: color, size: size)
	}
	
    public static func bold(color: UIColor = .textDefault, size: CGFloat = .system) -> TextStyle {
		return App.style.text.bold(color: color, size: size)
	}
}

extension TextStyle {
    @available(iOS 11.0, *)
    public static func largeTitle(color: UIColor = .largeTitle, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .largeTitle(dynamic: dynamic))
    }

    public static func title1(color: UIColor = .title1, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .title1(dynamic: dynamic))
    }

    public static func title2(color: UIColor = .title2, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .title2(dynamic: dynamic))
    }

    public static func title3(color: UIColor = .title3, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .title3(dynamic: dynamic))
    }

    public static func headline(color: UIColor = .headline, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .headline(dynamic: dynamic))
    }

    public static func body(color: UIColor = .body, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .body(dynamic: dynamic))
    }

    public static func callout(color: UIColor = .callout, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .callout(dynamic: dynamic))
    }

    public static func subheadline(color: UIColor = .subheadline, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .subheadline(dynamic: dynamic))
    }

    public static func footnote(color: UIColor = .footnote, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .footnote(dynamic: dynamic))
    }

    public static func caption1(color: UIColor = .caption1, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .caption1(dynamic: dynamic))
    }

    public static func caption2(color: UIColor = .caption2, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .caption2(dynamic: dynamic))
    }

    // MARK: Display Font

    @available(iOS 11.0, *)
    public static func displayLargeTitle(color: UIColor = .largeTitle, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayLargeTitle(dynamic: dynamic))
    }

    public static func displayTitle1(color: UIColor = .title1, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayTitle1(dynamic: dynamic))
    }

    public static func displayTitle2(color: UIColor = .title2, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayTitle2(dynamic: dynamic))
    }

    public static func displayTitle3(color: UIColor = .title3, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayTitle3(dynamic: dynamic))
    }

    public static func displayHeadline(color: UIColor = .headline, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayHeadline(dynamic: dynamic))
    }

    public static func displayBody(color: UIColor = .body, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayBody(dynamic: dynamic))
    }

    public static func displayCallout(color: UIColor = .callout, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayCallout(dynamic: dynamic))
    }

    public static func displaySubheadline(color: UIColor = .subheadline, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displaySubheadline(dynamic: dynamic))
    }

    public static func displayFootnote(color: UIColor = .footnote, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayFootnote(dynamic: dynamic))
    }

    public static func displayCaption1(color: UIColor = .caption1, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayCaption1(dynamic: dynamic))
    }

    public static func displayCaption2(color: UIColor = .caption2, dynamic: Bool = false) -> TextStyle {
        return TextStyle(color: color, font: .displayCaption2(dynamic: dynamic))
    }
}
