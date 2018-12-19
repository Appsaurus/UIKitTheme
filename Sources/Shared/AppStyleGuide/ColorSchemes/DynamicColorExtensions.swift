//
//  DynamicColorExtensions.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/6/18.
//

import Foundation
import DynamicColor

public enum RelativeContrastRank: Double{
	case max = 1.0
	case upperQuartile = 0.75
	case middle = 0.5
	case lowerQuartile = 0.25
	case min = 0.0
//    static public func rank(_ rank: Double) -> Double{
//        return rank.double
//    }
}
extension DynamicColor{
	public func contrastingColor(inContext context: ContrastDisplayContext = .standard,
								 rank: RelativeContrastRank = .max,
								 fromCandidates colors: DynamicColor...) -> UIColor{
		return contrastingColor(inContext: context, rank: rank, fromCandidates: colors)
	}
	public func contrastingColor(inContext context: ContrastDisplayContext = .standard,
								 rank: RelativeContrastRank = .max,
								 fromCandidates colors: [DynamicColor]) -> UIColor {

		//Sorted from least to most contrasting
		let sortedByContrast = colors.sorted(by: { (color1, color2) -> Bool in
			color1.contrastRatio(with: self) < color2.contrastRatio(with: self)
		}).filter { (color) -> Bool in
			color.isContrasting(with: self, inContext: context)
		}

        guard sortedByContrast.count > 0 else {
            return self.isLight() ? .black : .white
        }
        
		return sortedByContrast[normalizedIndex: rank.rawValue]
	}




	public func shaded(amount: CGFloat) -> DynamicColor{
		switch amount{
		case 0:
			return self
		case 0...CGFloat.infinity:
			return self.lighter(amount: amount)
		case -CGFloat.infinity...0:
			return self.darkened(amount: -amount)
		default: return self
		}
	}

	public func saturationAdjust(amount: CGFloat) -> DynamicColor{
		switch amount{
		case 0:
			return self
		case 0...CGFloat.infinity:
			return self.saturated(amount: amount)
		case -CGFloat.infinity...0:
			return self.desaturated(amount: -amount)
		default: return self
		}
	}

}

//MARK: Array conveniences

extension Array where Element: UIColor{
	public func firstContrasting(with color: UIColor, inContext context: DynamicColor.ContrastDisplayContext = .standard) -> UIColor?{
		return first(where: { (candidate) -> Bool in
			return candidate.isContrasting(with: color, inContext: context)
		})
	}
}
