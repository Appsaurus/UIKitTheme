//
//  ShadowStyle.swift
//  Pods
//
//  Created by Brian Strobach on 3/17/17.
//
//

import Foundation
import UIKit
open class ShadowStyle: Style{
    open var shadowColor: UIColor?
    open var shadowOffset: CGSize
    open var shadowOpacity: Float
    open var shadowRadius: CGFloat
    
    public init(shadowColor: UIColor? = nil, shadowOffset: CGSize = CGSize(width:0.0, height:-3.0), shadowOpacity: Float = 0.0, shadowRadius: CGFloat = 3.0) {
        self.shadowColor = shadowColor
        self.shadowOffset = shadowOffset
        self.shadowOpacity = shadowOpacity
        self.shadowRadius = shadowRadius
    }
    
    public var toNSShadow: NSShadow{
        let shadow = NSShadow()
        shadow.shadowColor = shadowColor?.withAlphaComponent(CGFloat(shadowOpacity))
        shadow.shadowOffset = shadowOffset
        shadow.shadowBlurRadius = shadowRadius
        return shadow
    }
    public var attributeDictionary: Dictionary<NSAttributedString.Key, Any>{
        return [.shadow : toNSShadow]
    }
}

public extension UIView{
    public func apply(shadowStyle style: ShadowStyle, optimizeRendering: Bool = true){
        layer.shadowColor = style.shadowColor?.cgColor
        layer.masksToBounds = layer.shadowColor != nil && style.shadowOpacity > 0.0 ? false : true
        layer.shadowOpacity = style.shadowOpacity
        layer.shadowOffset = style.shadowOffset
        layer.shadowRadius = style.shadowRadius
        
        //Perormance improvements for shadows
//        if optimizeRendering{
//            layer.shadowPath = UIBezierPath(rect:bounds).cgPath
//            self.optimizeRendering()
//        }
    }
    
    public func shadowStyle() -> ShadowStyle?{
        guard let shadowColor = layer.shadowColor else { return nil }
        return ShadowStyle(shadowColor: UIColor(cgColor: shadowColor), shadowOffset: layer.shadowOffset, shadowOpacity: layer.shadowOpacity, shadowRadius: layer.shadowRadius)
    }
}
