//
//  ColorPalette.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/7/18.
//

import UIKit

public protocol ColorPalette{
	static var colors: [UIColor] { get }
}

extension UIColor{
	public func flattened() -> UIColor{
		return closestMatch(in: FlatColors.colors)
	}
}
public class FlatColors: ColorPalette{
	//Array of all our colors
	public class var colors: [UIColor] {
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


