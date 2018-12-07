//
//  UIViewControllerExtensions.swift
//  UIKitTheme
//
//  Created by Brian Strobach on 12/7/18.
//  Copyright © 2018 Brian Strobach. All rights reserved.
//

import UIKit

extension UIViewController{

    @discardableResult
    public func setupNavigationBarTitleLabel(text: String = "", inset: UIEdgeInsets? = nil, style: TextStyle = NavigationBarStyle.default.titleTextStyle, maxNumberOfLines: Int = 1) -> UILabel{
        let navBar = navigationController!.navigationBar
        let frame = navBar.bounds.insetBy(dx: navBar.frame.w/6.0, dy: navBar.frame.h/5.0)
        let titleLabel = UILabel(frame: frame, text: text)
        titleLabel.apply(textStyle: style)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = maxNumberOfLines
        titleLabel.textAlignment = .center
        navigationItem.titleView = titleLabel
        return titleLabel
    }
}
