//
//  ColorPalette.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/7/18.
//

import UIKit

public protocol ColorPalette {
	static var colors: [UIColor] { get }
}

extension UIColor {
	public func flattened() -> UIColor {
		return closestMatch(in: FlatColors.colors)
	}
}
public class FlatColors: ColorPalette {
    public class var colors: [UIColor] {
        //swiftlint:disable:next line_length
		return [black, blackDark, blue, blueDark, brown, brownDark, coffee, coffeeDark, forestGreen, forestGreenDark, gray, grayDark, green, greenDark, lime, limeDark, magenta, magentaDark, maroon, maroonDark, mint, mintDark, navyBlue, navyBlueDark, orange, orangeDark, pink, pinkDark, plum, plumDark, powderBlue, powderBlueDark, purple, purpleDark, red, redDark, sand, sandDark, skyBlue, skyBlueDark, teal, tealDark, watermelon, watermelonDark, white, whiteDark, yellow, yellowDark]
	}

	// MARK: - Flat colors - Light Shades
	public class var black: UIColor {
		return .hsb(0, 0, 17)
	}
	public class var blue: UIColor {
		return .hsb(224, 50, 63)
	}
	public class var brown: UIColor {
		return .hsb(24, 45, 37)
	}
	public class var coffee: UIColor {
		return .hsb(25, 31, 64)
	}
	public class var forestGreen: UIColor {
		return .hsb(138, 45, 37)
	}
	public class var gray: UIColor {
		return .hsb(184, 10, 65)
	}
	public class var green: UIColor {
		return .hsb(145, 77, 80)
	}
	public class var lime: UIColor {
		return .hsb(74, 70, 78)
	}
	public class var magenta: UIColor {
		return .hsb(283, 51, 71)
	}
	public class var maroon: UIColor {
		return .hsb(5, 65, 47)
	}
	public class var mint: UIColor {
		return .hsb(168, 86, 74)
	}
	public class var navyBlue: UIColor {
		return .hsb(210, 45, 37)
	}
	public class var orange: UIColor {
		return .hsb(28, 85, 90)
	}
	public class var pink: UIColor {
		return .hsb(324, 49, 96)
	}
	public class var plum: UIColor {
		return .hsb(300, 45, 37)
	}
	public class var powderBlue: UIColor {
		return .hsb(222, 24, 95)
	}
	public class var purple: UIColor {
		return .hsb(253, 52, 77)
	}
	public class var red: UIColor {
		return .hsb(6, 74, 91)
	}
	public class var sand: UIColor {
		return .hsb(42, 25, 94)
	}
	public class var skyBlue: UIColor {
		return .hsb(204, 76, 86)
	}
	public class var teal: UIColor {
		return .hsb(195, 55, 51)
	}
	public class var watermelon: UIColor {
		return .hsb(356, 53, 94)
	}
	public class var white: UIColor {
		return .hsb(192, 2, 95)
	}
	public class var yellow: UIColor {
		return .hsb(48, 99, 100)
	}
	// MARK: - Flat colors - Dark Shades
	public class var blackDark: UIColor {
		return .hsb(0, 0, 15)
	}
	public class var blueDark: UIColor {
		return .hsb(224, 56, 51)
	}
	public class var brownDark: UIColor {
		return .hsb(25, 45, 31)
	}
	public class var coffeeDark: UIColor {
		return .hsb(25, 34, 56)
	}
	public class var forestGreenDark: UIColor {
		return .hsb(135, 44, 31)
	}
	public class var grayDark: UIColor {
		return .hsb(184, 10, 55)
	}
	public class var greenDark: UIColor {
		return .hsb(145, 78, 68)
	}
	public class var limeDark: UIColor {
		return .hsb(74, 81, 69)
	}
	public class var magentaDark: UIColor {
		return .hsb(282, 61, 68)
	}
	public class var maroonDark: UIColor {
		return .hsb(4, 68, 40)
	}
	public class var mintDark: UIColor {
		return .hsb(168, 86, 63)
	}
	public class var navyBlueDark: UIColor {
		return .hsb(210, 45, 31)
	}
	public class var orangeDark: UIColor {
		return .hsb(24, 100, 83)
	}
	public class var pinkDark: UIColor {
		return .hsb(327, 57, 83)
	}
	public class var plumDark: UIColor {
		return .hsb(300, 46, 31)
	}
	public class var powderBlueDark: UIColor {
		return .hsb(222, 28, 84)
	}
	public class var purpleDark: UIColor {
		return .hsb(253, 56, 64)
	}
	public class var redDark: UIColor {
		return .hsb(6, 78, 75)
	}
	public class var sandDark: UIColor {
		return .hsb(42, 30, 84)
	}
	public class var skyBlueDark: UIColor {
		return .hsb(204, 78, 73)
	}
	public class var tealDark: UIColor {
		return .hsb(196, 54, 45)
	}
	public class var watermelonDark: UIColor {
		return .hsb(358, 61, 85)
	}
	public class var whiteDark: UIColor {
		return .hsb(204, 5, 78)
	}
	public class var yellowDark: UIColor {
		return .hsb(40, 100, 100)
	}
}

//enum ColorCompatibility {
//    static var label: UIColor {
//        if #available(iOS 13, *) {
//            return .label
//        }
//        return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
//    }
//    static var secondaryLabel: UIColor {
//        if #available(iOS 13, *) {
//            return .secondaryLabel
//        }
//        return UIColor(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.6)
//    }
//    static var tertiaryLabel: UIColor {
//        if #available(iOS 13, *) {
//            return .tertiaryLabel
//        }
//        return UIColor(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.3)
//    }
//    static var quaternaryLabel: UIColor {
//        if #available(iOS 13, *) {
//            return .quaternaryLabel
//        }
//        return UIColor(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.18)
//    }
//    static var systemFill: UIColor {
//        if #available(iOS 13, *) {
//            return .systemFill
//        }
//        return UIColor(red: 0.47058823529411764, green: 0.47058823529411764, blue: 0.5019607843137255, alpha: 0.2)
//    }
//    static var secondarySystemFill: UIColor {
//        if #available(iOS 13, *) {
//            return .secondarySystemFill
//        }
//        return UIColor(red: 0.47058823529411764, green: 0.47058823529411764, blue: 0.5019607843137255, alpha: 0.16)
//    }
//    static var tertiarySystemFill: UIColor {
//        if #available(iOS 13, *) {
//            return .tertiarySystemFill
//        }
//        return UIColor(red: 0.4627450980392157, green: 0.4627450980392157, blue: 0.5019607843137255, alpha: 0.12)
//    }
//    static var quaternarySystemFill: UIColor {
//        if #available(iOS 13, *) {
//            return .quaternarySystemFill
//        }
//        return UIColor(red: 0.4549019607843137, green: 0.4549019607843137, blue: 0.5019607843137255, alpha: 0.08)
//    }
//    static var placeholderText: UIColor {
//        if #available(iOS 13, *) {
//            return .placeholderText
//        }
//        return UIColor(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.3)
//    }
//    static var systemBackground: UIColor {
//        if #available(iOS 13, *) {
//            return .systemBackground
//        }
//        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    }
//    static var secondarySystemBackground: UIColor {
//        if #available(iOS 13, *) {
//            return .secondarySystemBackground
//        }
//        return UIColor(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0)
//    }
//    static var tertiarySystemBackground: UIColor {
//        if #available(iOS 13, *) {
//            return .tertiarySystemBackground
//        }
//        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    }
//    static var systemGroupedBackground: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGroupedBackground
//        }
//        return UIColor(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0)
//    }
//    static var secondarySystemGroupedBackground: UIColor {
//        if #available(iOS 13, *) {
//            return .secondarySystemGroupedBackground
//        }
//        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
//    }
//    static var tertiarySystemGroupedBackground: UIColor {
//        if #available(iOS 13, *) {
//            return .tertiarySystemGroupedBackground
//        }
//        return UIColor(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0)
//    }
//    static var separator: UIColor {
//        if #available(iOS 13, *) {
//            return .separator
//        }
//        return UIColor(red: 0.23529411764705882, green: 0.23529411764705882, blue: 0.2627450980392157, alpha: 0.29)
//    }
//    static var opaqueSeparator: UIColor {
//        if #available(iOS 13, *) {
//            return .opaqueSeparator
//        }
//        return UIColor(red: 0.7764705882352941, green: 0.7764705882352941, blue: 0.7843137254901961, alpha: 1.0)
//    }
//    static var link: UIColor {
//        if #available(iOS 13, *) {
//            return .link
//        }
//        return UIColor(red: 0.0, green: 0.47843137254901963, blue: 1.0, alpha: 1.0)
//    }
//    static var darkText: UIColor {
//        if #available(iOS 13, *) {
//            return .darkText
//        }
//        return UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 1.0)
//    }
//    static var lightText: UIColor {
//        if #available(iOS 13, *) {
//            return .lightText
//        }
//        return UIColor(red: 1.0, green: 1.0, blue: 1.0, alpha: 0.6)
//    }
//    static var systemBlue: UIColor {
//        if #available(iOS 13, *) {
//            return .systemBlue
//        }
//        return UIColor(red: 0.0, green: 0.47843137254901963, blue: 1.0, alpha: 1.0)
//    }
//    static var systemBrown: UIColor {
//        if #available(iOS 13, *) {
//            return .systemBrown
//        }
//        return UIColor(red: 0.6352941176470588, green: 0.5176470588235295, blue: 0.3686274509803922, alpha: 1.0)
//    }
//    static var systemGreen: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGreen
//        }
//        return UIColor(red: 0.20392156862745098, green: 0.7803921568627451, blue: 0.34901960784313724, alpha: 1.0)
//    }
//    static var systemIndigo: UIColor {
//        if #available(iOS 13, *) {
//            return .systemIndigo
//        }
//        return UIColor(red: 0.34509803921568627, green: 0.33725490196078434, blue: 0.8392156862745098, alpha: 1.0)
//    }
//    static var systemOrange: UIColor {
//        if #available(iOS 13, *) {
//            return .systemOrange
//        }
//        return UIColor(red: 1.0, green: 0.5843137254901961, blue: 0.0, alpha: 1.0)
//    }
//    static var systemPink: UIColor {
//        if #available(iOS 13, *) {
//            return .systemPink
//        }
//        return UIColor(red: 1.0, green: 0.17647058823529413, blue: 0.3333333333333333, alpha: 1.0)
//    }
//    static var systemPurple: UIColor {
//        if #available(iOS 13, *) {
//            return .systemPurple
//        }
//        return UIColor(red: 0.6862745098039216, green: 0.3215686274509804, blue: 0.8705882352941177, alpha: 1.0)
//    }
//    static var systemRed: UIColor {
//        if #available(iOS 13, *) {
//            return .systemRed
//        }
//        return UIColor(red: 1.0, green: 0.23137254901960785, blue: 0.18823529411764706, alpha: 1.0)
//    }
//    static var systemTeal: UIColor {
//        if #available(iOS 13, *) {
//            return .systemTeal
//        }
//        return UIColor(red: 0.35294117647058826, green: 0.7843137254901961, blue: 0.9803921568627451, alpha: 1.0)
//    }
//    static var systemYellow: UIColor {
//        if #available(iOS 13, *) {
//            return .systemYellow
//        }
//        return UIColor(red: 1.0, green: 0.8, blue: 0.0, alpha: 1.0)
//    }
//    static var systemGray: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGray
//        }
//        return UIColor(red: 0.5568627450980392, green: 0.5568627450980392, blue: 0.5764705882352941, alpha: 1.0)
//    }
//    static var systemGray2: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGray2
//        }
//        return UIColor(red: 0.6823529411764706, green: 0.6823529411764706, blue: 0.6980392156862745, alpha: 1.0)
//    }
//    static var systemGray3: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGray3
//        }
//        return UIColor(red: 0.7803921568627451, green: 0.7803921568627451, blue: 0.8, alpha: 1.0)
//    }
//    static var systemGray4: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGray4
//        }
//        return UIColor(red: 0.8196078431372549, green: 0.8196078431372549, blue: 0.8392156862745098, alpha: 1.0)
//    }
//    static var systemGray5: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGray5
//        }
//        return UIColor(red: 0.8980392156862745, green: 0.8980392156862745, blue: 0.9176470588235294, alpha: 1.0)
//    }
//    static var systemGray6: UIColor {
//        if #available(iOS 13, *) {
//            return .systemGray6
//        }
//        return UIColor(red: 0.9490196078431372, green: 0.9490196078431372, blue: 0.9686274509803922, alpha: 1.0)
//    }
//}
