//
//  StyleMixin.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKitMixinable

public class StyleableViewControllerMixin: UIViewControllerMixin<Styleable>{
    open override func didFinishCreatingAllViews(){
        mixable.bindStyle()
    }
}
public class StyleableViewMixin: UIViewMixin<Styleable>{
    open override func didFinishCreatingAllViews(){
        mixable.bindStyle()
    }
}
