//
//  NavigationBarStyleable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/28/18.
//

import UIKit
import DarkMagic
import UIKitExtensions
import Swiftest

public protocol NavigationBarStyleable: AnyObject {
    var navigationBarStyle: NavigationBarStyle? { get set }
    var overridesChildNavigationBarStyles: Bool { get set }
    func apply(navigationBarStyle: NavigationBarStyle)
    func applyDefaultNavigationBarStyle()
    func animateToDefaultNavigationBarStyle()
}

extension UIViewController: NavigationBarStyleable {
    public func apply(navigationBarStyle: NavigationBarStyle) {
        guard let selfNav = self as? UINavigationController else {
            navigationController?.navigationBar.apply(navigationBarStyle: navigationBarStyle)
            return
        }
        selfNav.navigationBar.apply(navigationBarStyle: navigationBarStyle)
    }

    private var _navigationBarStyle: NavigationBarStyle? {
        if let selfNav = self as? UINavigationController {
            return selfNav.overridesChildNavigationBarStyles ? navigationBarStyle : selfNav.viewControllers.last?.navigationBarStyle
        }

        if navigationController?.overridesChildNavigationBarStyles == true {
            return navigationController?.navigationBarStyle ?? navigationBarStyle
        }
        return navigationBarStyle
    }

    public func applyDefaultNavigationBarStyle() {
        guard let style = _navigationBarStyle else { return }
        self.apply(navigationBarStyle: style)
    }

    public func animateToPreviousViewControllerNavigationBarStyle() {
        guard let navVC = navigationController,
            let index = navVC.viewControllers.firstIndex(of: self),
            index > 0 else { return }
        let previousVC = navVC.viewControllers[index - 1]
        guard let style = previousVC.navigationBarStyle else { return }
        navigationController?.apply(navigationBarStyle: style)
    }
    public func animateToDefaultNavigationBarStyle() {
        guard let style = _navigationBarStyle else { return }

        guard let transitionCoordinator = transitionCoordinator else {
            self.apply(navigationBarStyle: style)
            return
        }

        transitionCoordinator.animate(alongsideTransition: {[weak self] (context) in
            guard let self = self else { return }
            if context.viewController(forKey: .to) === self {
                self.applyDefaultNavigationBarStyle()
            }
        }, completion: nil)
    }
}

private extension AssociatedObjectKeys {
    static let overridesChildNavigationBarStyles = AssociatedObjectKey<Bool>("overridesChildNavigationBarStyles")
}

public extension NavigationBarStyleable where Self: UIViewController {

    var overridesChildNavigationBarStyles: Bool {
        get {
            return self[.overridesChildNavigationBarStyles, false]
        }
        set {
            self[.overridesChildNavigationBarStyles] = newValue
        }
    }
}

private extension AssociatedObjectKeys {
    static let navigationBarStyle = AssociatedObjectKey<NavigationBarStyle>("navigationBarStyle")
}

public extension NavigationBarStyleable where Self: NSObject {

    var navigationBarStyle: NavigationBarStyle? {
        get {
            return self[.navigationBarStyle]
        }
        set {
            self[.navigationBarStyle] = newValue
            applyDefaultNavigationBarStyle()
        }
    }

}
