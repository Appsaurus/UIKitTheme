//
//  NavigationBarStyleable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/28/18.
//

import UIKitMixinable

public class NavigationBarStyleableMixin: UIViewControllerMixin<UIViewController & NavigationBarStyleable>{
    open override func viewWillAppear(_ animated: Bool) {
        mixable.animateToDefaultNavigationBarStyle()
    }
    
    open override func viewDidAppear(_ animated: Bool) {
        mixable.applyDefaultNavigationBarStyle()
    }
}
