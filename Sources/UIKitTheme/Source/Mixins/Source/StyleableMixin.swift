//
//  StyleMixin.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKitMixinable
import ObjectiveC

public class StyleableViewControllerMixin: UIViewControllerMixin<NSObject & Styleable> {
    open override func didFinishCreatingAllViews() {
        mixable?.bindStyle()
    }
}
public class StyleableViewMixin: UIViewMixin<NSObject & Styleable> {
    open override func didFinishCreatingAllViews() {
        mixable?.bindStyle()
    }
}
