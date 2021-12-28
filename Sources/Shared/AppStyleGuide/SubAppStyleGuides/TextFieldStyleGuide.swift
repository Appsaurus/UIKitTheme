//
//  TextFieldStyleGuide.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import Foundation

open class TextFieldStyleDefaults: SubAppStyleGuideDefaults {
	open lazy var textFieldStyle: TextFieldStyle = TextFieldStyle(textStyle: text.regular())
//    open lazy var materialTextFieldStyle: MaterialTextFieldStyle = MaterialTextFieldStyle(textStyle: text.regular())
//    open lazy var materialTextFieldMap: TextFieldStyleMap = textField.materialStyleMap(color: .textDark, titleColor: .textMediumLight)
}

open class TextFieldStyleGuide: SubAppStyleGuide, DefaultSettingsManaged {

	public typealias Defaults = TextFieldStyleDefaults
	open lazy var defaults: Defaults = Defaults(appStyleGuide: appStyleGuide)
	open lazy var defaultStyle: TextFieldStyle = defaults.textFieldStyle

}

// MARK: Convenience Extensions
// Make it easy to access functions from current style guide inside method signatures at call site.
extension TextFieldStyle {
	public static var defaultStyle: TextFieldStyle {
		return App.style.textField.defaultStyle
	}
}
