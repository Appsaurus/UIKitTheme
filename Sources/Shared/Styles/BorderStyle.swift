//
//  BorderStyle.swift
//  Pods
//
//  Created by Brian Strobach on 9/30/16.
//
//

import Foundation
import UIKit

open class BorderStyle: Style{
    open var borderColor: UIColor?
    open var borderWidth: CGFloat

    
    public init(borderColor: UIColor? = nil, borderWidth: CGFloat = 0.0) {
        self.borderColor = borderColor
        self.borderWidth = borderWidth
    }
}


public extension UIView{
    
    public func borderStyle_() -> BorderStyle{
        return BorderStyle(borderColor: borderColor, borderWidth: borderWidth)
    }
    
    public func apply(borderStyle style: BorderStyle?, optimizeRendering: Bool = false){
		guard let style = style else{
			layer.borderWidth = 0.0
			borderColor = nil
			return
		}
        borderWidth = style.borderWidth
        borderColor = style.borderColor        
    }
}


