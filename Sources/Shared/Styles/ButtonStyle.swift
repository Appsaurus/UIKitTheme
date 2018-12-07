//
//  ButtonStyle.swift
//  Pods
//
//  Created by Brian Strobach on 9/24/16.
//
//

import Foundation
import UIKit
//import DinoDNA

open class ButtonStyle: Style{
    open var textStyle: TextStyle
    open var viewStyle: ViewStyle
    
    public init(textStyle: TextStyle, viewStyle: ViewStyle = ViewStyle(backgroundColor: .clear)) {
        self.textStyle = textStyle
        self.viewStyle = viewStyle
    }
}

public protocol ButtonStyleable{
    func apply(buttonStyle style: ButtonStyle)
}
extension ButtonStyleable where Self: TextStyleable & ViewStyleable{
    public func apply(buttonStyle style: ButtonStyle){
        apply(textStyle: style.textStyle)
        apply(viewStyle: style.viewStyle, optimizeRendering: false)
    }
}
extension UIButton: ButtonStyleable{}
