//
//  ButtonStyle.swift
//  Pods
//
//  Created by Brian Strobach on 9/24/16.
//
//

import Foundation
import UIKit

open class ButtonStyle: Style {
    open var textStyle: TextStyle
    open var viewStyle: ViewStyle
    
    public init(textStyle: TextStyle, viewStyle: ViewStyle = ViewStyle(backgroundColor: .clear)) {
        self.textStyle = textStyle
        self.viewStyle = viewStyle
    }
}

public protocol ButtonStyleable {
    func apply(buttonStyle style: ButtonStyle)
}

extension Collection where Element: ButtonStyleable {
    public func apply(buttonStyle style: ButtonStyle) {
        for item in self {
            item.apply(buttonStyle: style)
        }
    }
}
extension ButtonStyleable where Self: TextStyleable & ViewStyleable {
    public func apply(buttonStyle style: ButtonStyle) {
        apply(textStyle: style.textStyle)
        apply(viewStyle: style.viewStyle, optimizeRendering: false)
    }
}
extension UIButton: ButtonStyleable {}
