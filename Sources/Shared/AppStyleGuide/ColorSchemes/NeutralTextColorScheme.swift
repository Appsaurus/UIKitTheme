//
//  NeutralTextColorScheme.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class NeutralTextColorScheme: NeutralColorScheme {
	open lazy var defaultText: UIColor = dark

}

extension UIColor {

	//Text
	public static var textDefault: UIColor { return App.colors.text.defaultText}
	public static var textLight: UIColor { return App.colors.text.light }
	public static var textMediumLight: UIColor { return App.colors.text.mediumLight }
	public static var textMedium: UIColor { return App.colors.text.medium }
	public static var textMediumDark: UIColor { return App.colors.text.mediumDark }
	public static var textDark: UIColor { return App.colors.text.dark }

}
