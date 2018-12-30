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
//Make it easy to access functions from current style guide inside method signatures at call site.
extension TextFieldStyle {
	public static var defaultStyle: TextFieldStyle {
		return App.style.textField.defaultStyle
	}
}

//public protocol T{}
//extension TextFieldState : T {}
//extension Dictionary where Key:T, Value:TextFieldStyle {
//    public static func materialStyleMap(color: UIColor? = nil,
//                                        titleColor: UIColor? = nil,
//                                        disabledColor: UIColor? = nil,
//                                        textSize: CGFloat = 14.0,
//                                        secondarySize: CGFloat = 10.0) -> TextFieldStyleMap{
//        return App.style.textField.materialStyleMap(color: color, titleColor: titleColor, disabledColor: disabledColor, textSize: textSize, secondarySize: secondarySize)
//    }
//
//    public static var defaultMaterialStyleMap: TextFieldStyleMap{
//        return App.style.textField.defaults.materialTextFieldMap
//    }
//
//    public static var lightMaterialStyleMap: TextFieldStyleMap{
//        return materialStyleMap(color: .textLight)
//    }
//
//    public static var darkMaterialStyleMap: TextFieldStyleMap{
//        return materialStyleMap(color: .textDark)
//    }
//
//    public static func materialStyleMap(contrasting color: UIColor) -> TextFieldStyleMap{
//
//        if color == .primary { return materialStyleMap(color: .primaryContrast) }
//        if color == .primaryContrast { return materialStyleMap(color: .primary) }
//        let contrast = color.contrastingColor(fromCandidates: [.textDark, .textLight, .primary, .primaryContrast])
//        return materialStyleMap(color: contrast)
//    }
//}
