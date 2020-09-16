//
//  GradientView.swift
//  Pods
//
//  Created by Brian Strobach on 5/25/17.
//
//

import UIKit
import UIKitExtensions

public class GradientConfiguration {
    open var colors: [UIColor]
    open var orientation: GradientOrientation
    open var locations: [NSNumber] = [0, 1]
    public init(colors: [UIColor] = [.white, .clear], orientation: GradientOrientation = .leftRight, locations: [NSNumber] = [0, 1]) {
        self.locations = locations
        self.colors = colors
        self.orientation = orientation
    }
    
    public func toLayer(frame: CGRect) -> CAGradientLayer {
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame = frame
        gradientLayer.colors = colors.map({ (color) -> CGColor in
             color.cgColor
        })
        gradientLayer.startPoint = orientation.position().startPoint
        gradientLayer.endPoint = orientation.position().endPoint
        gradientLayer.locations = locations
        return gradientLayer
    }
    
    public func toImage(frame: CGRect) -> UIImage? {
        let gradientLayer = toLayer(frame: frame)
        let image = UIImage.imageWithLayer(layer: gradientLayer)
        return image
    }
    public func toColor(frame: CGRect) -> UIColor? {
        guard let image = toImage(frame: frame) else { return nil }
        return UIColor(patternImage: image)        
    }
//    
//    public func toView(frame: CGRect) -> GradientView{
//        let gv = GradientView()
//        gv.locations = [orientation.position().startPoint, orientation.position().endPoint]
//        gv.colors = colors
//        return gv
//    }
}

public typealias GradientPoints = (startPoint: CGPoint, endPoint: CGPoint)

public enum GradientOrientation {
    case leftRight
    case rightLeft
    case topBottom
    case bottomTop
    case topLeftBottomRight
    case bottomRightTopLeft
    case topRightBottomLeft
    case bottomLeftTopRight
    case custom(points: GradientPoints)
    
    public func position() -> GradientPoints {
        switch self {
        case .leftRight:
            return (startPoint: CGPoint(x: 0, y: 0.5), endPoint: CGPoint(x: 1, y: 0.5))
        case .rightLeft:
            return (startPoint: CGPoint(x: 1, y: 0.5), endPoint: CGPoint(x: 0, y: 0.5))
        case .topBottom:
            return (startPoint: CGPoint(x: 0.5, y: 0), endPoint: CGPoint(x: 0.5, y: 1))
        case .bottomTop:
            return (startPoint: CGPoint(x: 0.5, y: 1), endPoint: CGPoint(x: 0.5, y: 0))
        case .topLeftBottomRight:
            return (startPoint: CGPoint(x: 0, y: 0), endPoint: CGPoint(x: 1, y: 1))
        case .bottomRightTopLeft:
            return (startPoint: CGPoint(x: 1, y: 1), endPoint: CGPoint(x: 0, y: 0))
        case .topRightBottomLeft:
            return (startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 1))
        case .bottomLeftTopRight:
            return (startPoint: CGPoint(x: 0, y: 1), endPoint: CGPoint(x: 1, y: 0))
        case .custom(let points):
            return points
        }
    }
    
}

public extension UIView {
    
    /// Applies a gradient mask to view.
    ///
    /// - Parameters:
    ///   - gradient: Note gradient colors will be ignored and replaced with proper colors for mask
    @discardableResult
    func applyGradientMask(gradient: GradientConfiguration, frame: CGRect? = nil, at index: Int = 0) -> CAGradientLayer {
        gradient.colors = [.white, .clear]
        let gradientLayer = apply(gradient: gradient, frame: frame, at: index)
        self.layer.mask = gradientLayer
        return gradientLayer
    }
    
    @discardableResult
    func apply(gradient: GradientConfiguration, frame: CGRect? = nil, at index: Int = 0) -> CAGradientLayer {
        if let existingLayer = self.layer.sublayers?[index] as? CAGradientLayer {
            return existingLayer
        } //Guard against adding multiple gradients
        let gradientLayer: CAGradientLayer = gradient.toLayer(frame: frame ?? self.bounds)
        self.layer.insertSublayer(gradientLayer, at: UInt32(index))
        return gradientLayer
    }
}
