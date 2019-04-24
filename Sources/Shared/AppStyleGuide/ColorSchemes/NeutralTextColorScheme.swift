//
//  NeutralTextColorScheme.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit

open class NeutralTextColorScheme: NeutralColorScheme {
	open lazy var defaultText: UIColor = dark

    @available(iOS 11.0, *)
    open lazy var largeTitle: UIColor = defaultText
    open lazy var title1: UIColor = defaultText
    open lazy var title2: UIColor = defaultText
    open lazy var title3: UIColor = defaultText
    open lazy var headline: UIColor = defaultText
    open lazy var body: UIColor = defaultText
    open lazy var callout: UIColor = defaultText
    open lazy var subheadline: UIColor = defaultText
    open lazy var footnote: UIColor = defaultText
    open lazy var caption1: UIColor = defaultText
    open lazy var caption2: UIColor = defaultText
}

extension UIColor {

    // MARK: Default
	public static var textDefault: UIColor { return App.colors.text.defaultText}

    // MARK: By brightness, light to dark
	public static var textLight: UIColor { return App.colors.text.light }
	public static var textMediumLight: UIColor { return App.colors.text.mediumLight }
	public static var textMedium: UIColor { return App.colors.text.medium }
	public static var textMediumDark: UIColor { return App.colors.text.mediumDark }
	public static var textDark: UIColor { return App.colors.text.dark }

    // MARK: Mapped to UIFont.TextStyle
    @available(iOS 11.0, *)
    public static var largeTitle: UIColor { return App.colors.text.largeTitle }
    public static var title1: UIColor { return App.colors.text.title1 }
    public static var title2: UIColor { return App.colors.text.title2 }
    public static var title3: UIColor { return App.colors.text.title3 }
    public static var headline: UIColor { return App.colors.text.headline }
    public static var body: UIColor { return App.colors.text.body }
    public static var callout: UIColor { return App.colors.text.callout }
    public static var subheadline: UIColor { return App.colors.text.subheadline }
    public static var footnote: UIColor { return App.colors.text.footnote }
    public static var caption1: UIColor { return App.colors.text.caption1 }
    public static var caption2: UIColor { return App.colors.text.caption2 }

}
