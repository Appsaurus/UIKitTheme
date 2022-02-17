//
//  ColorSchemeGenerator.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/7/18.
//

#if canImport(UIKit)
import UIKitExtensions
import Foundation
import DynamicColor
open class ColorSchemeGenerator {
    
    //Creates an array with 5 colors, 2 analagous colors on each side of the predefined color
    public class func analogous(from seedColor: UIColor, range: Double = 40, brightnessAdjust: CGFloat = -0.15, saturationAdjust: Double = -0.15) -> [UIColor] {
        let halfRange = range / 2.0
        let first = seedColor.adjustedHue(amount: -range).saturated(amount: saturationAdjust)
        let second = seedColor.adjustedHue(amount: -halfRange).saturated(amount: saturationAdjust).brighten(amount: brightnessAdjust)
        let third = seedColor
        let fourth = seedColor.adjustedHue(amount: halfRange).saturated(amount: saturationAdjust).brighten(amount: brightnessAdjust)
        let fifth = seedColor.adjustedHue(amount: range).saturated(amount: saturationAdjust)
        
        return [first, second, third, fourth, fifth]
    }
    
    /// Generates a split complementary color scheme from a primary seed color.
    ///
    /// - Parameters:
    ///   - seedColor: Color to seed the scheme. Will be primary color, returned as first value in array of output colors.
    ///   - distance: Degrees on color wheel that separate the two split complements.
    /// - Returns: Array of scheme colors.
    public class func splitComplementary(from seedColor: UIColor,
                                         distance: CGFloat = 40,
                                         saturationAdjust: CGFloat = 0.1,
                                         brightnessAdjust: CGFloat = 0.0,
                                         shadeAdjust: CGFloat = -0.12) -> [UIColor] {
        let distanceFromComplement = distance / 2.0
        let first = seedColor
        let second = seedColor.complemented()
        let third = second.darkened(amount: 0.45).saturationAdjust(amount: -0.45)
        func adjustedComplement(_ color: UIColor) -> UIColor {
            
            let adjusted = color.brighten(amount: brightnessAdjust)
                .saturated(amount: saturationAdjust)
                .shaded(amount: shadeAdjust)
            return adjusted
        }
        
        let fourth = adjustedComplement(second.adjustedHue(amount: distanceFromComplement))
        let fifth = adjustedComplement(second.adjustedHue(amount: -distanceFromComplement))
        
        return [first, second, third, fourth, fifth]
    }
    
    public class func complementary(from seedColor: UIColor) -> [UIColor] {
        let first = seedColor.saturated(amount: 0.05).brighten(amount: -0.3)
        let second = seedColor.saturated(amount: -0.1).brighten(amount: 0.9)
        let third = seedColor
        let fourth = seedColor.complemented()
        let fifth = seedColor.complemented().saturated(amount: 0.2).brighten(amount: -0.3)
        
        return [first, second, third, fourth, fifth]
    }
    
    public class func gradient(colors: [UIColor], paletteSize: UInt = 5, in colorSpace: DynamicColorSpace = .hsl) -> [UIColor] {
        return DynamicGradient(colors: colors).colorPalette(amount: paletteSize, inColorSpace: .hsl)
    }
}
#endif
