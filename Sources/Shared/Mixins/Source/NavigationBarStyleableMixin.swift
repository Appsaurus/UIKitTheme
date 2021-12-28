//
//  NavigationBarStyleableMixin.swift
//  UIKitTheme
//
//  Created by Brian Strobach on 8/20/19.
//  Copyright © 2019 Brian Strobach. All rights reserved.
//
import UIKitMixinable

// See notes here: https://stackoverflow.com/questions/40243112/uinavigationbar-change-colors-on-push
public class NavigationBarStyleableMixin: UIViewControllerMixin<UIViewController & NavigationBarStyleable> {

    open override func viewWillAppear(_ animated: Bool) {
        mixable?.animateToDefaultNavigationBarStyle()
    }
    open override func viewDidLoad() {
        mixable?.applyDefaultNavigationBarStyle()
    }

    open override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        guard parent == nil else { return }
        mixable?.animateToPreviousViewControllerNavigationBarStyle()
    }

}
