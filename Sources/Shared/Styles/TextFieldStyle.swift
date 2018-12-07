//
//  TextFieldStyle.swift
//  Pods
//
//  Created by Brian Strobach on 9/12/17.
//
//

import Foundation

import UIKit
//import DinoDNA

open class TextFieldStyle: Style{
    open var textStyle: TextStyle
    open var viewStyle: ViewStyle
    
    public init(textStyle: TextStyle, viewStyle: ViewStyle = ViewStyle()) {
        self.textStyle = textStyle
        self.viewStyle = viewStyle
    }
}

public protocol TextFieldStyleable{
    func apply(textFieldStyle: TextFieldStyle)
}
extension TextFieldStyleable where Self: TextStyleable & ViewStyleable{
    public func apply(textFieldStyle: TextFieldStyle){
        apply(textStyle: textFieldStyle.textStyle)
        apply(viewStyle: textFieldStyle.viewStyle, optimizeRendering: false)
//        guard let materialField = self as? MaterialTextField, let materialStyle = textFieldStyle as? MaterialTextFieldStyle else { return }
//        materialField.underlineView.apply(viewStyle: materialStyle.underlineViewStyle)
//        materialField.titleLabel.apply(textStyle: materialStyle.titleLabelTextStyle)
//        materialField.secondaryLabel.apply(textStyle: materialStyle.secondaryLabelTextStyle)
    }
}
extension UITextField: TextFieldStyleable{}
extension UILabel: TextFieldStyleable{}
extension UITextView: TextFieldStyleable{}
