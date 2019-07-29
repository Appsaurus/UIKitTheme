//
//  NavigationBarStyleable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/28/18.
//

import UIKit
import DarkMagic
import UIKitExtensions


public protocol NavigationBarStyleable: class {
    var navigationBarStyle: NavigationBarStyle? { get set }
    var overridesChildNavigationBarStyles: Bool { get set }
    func apply(navigationBarStyle: NavigationBarStyle)
    func applyDefaultNavigationBarStyle()
    func animateToDefaultNavigationBarStyle()
}

//public extension UIViewController {
//    func parent(where test: (UIViewController) -> Bool) -> UIViewController? {
//        var nextParent = self.parent
//        while let parentToTest = nextParent  {
//            if test(parentToTest) { return parentToTest }
//            nextParent = parentToTest.parent
//        }
//        return nil
//    }
//}
extension UIViewController: NavigationBarStyleable {
    public func apply(navigationBarStyle: NavigationBarStyle) {
        guard let selfNav = self as? UINavigationController else {
            print("Apply nav style from \(className) \(navigationBarStyle.barColor)")
            navigationController?.navigationBar.apply(navigationBarStyle: navigationBarStyle)
            return
        }
        print("Apply nav nav style from \(className) \(navigationBarStyle.barColor)")
        selfNav.navigationBar.apply(navigationBarStyle: navigationBarStyle)
    }

    private var _navigationBarStyle: NavigationBarStyle? {
        if self is UINavigationController {
            return navigationBarStyle
        }

        guard let navigationController = navigationController else { return nil }

        if navigationController.overridesChildNavigationBarStyles == true  {
            return navigationController.navigationBarStyle ?? navigationBarStyle
        }

        return navigationBarStyle
    }

    public func applyDefaultNavigationBarStyle() {
        guard let style = _navigationBarStyle else { return }
        self.apply(navigationBarStyle: style)
    }

    public func animateToDefaultNavigationBarStyle() {
        guard let style = _navigationBarStyle else { return }

        guard let transitionCoordinator = transitionCoordinator else {
            self.apply(navigationBarStyle: style)
            return
        }
        let destinationVC = transitionCoordinator.toViewController

        transitionCoordinator.animate(alongsideTransition: { (_) in
            destinationVC.apply(navigationBarStyle: style)
        }, completion: nil)
    }
}

private extension AssociatedObjectKeys{
    static let overridesChildNavigationBarStyles = AssociatedObjectKey<Bool>("overridesChildNavigationBarStyles")
}

public extension NavigationBarStyleable where Self: UIViewController{

    public var overridesChildNavigationBarStyles: Bool{
        get{
            return self[.overridesChildNavigationBarStyles, true]
        }
        set{
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
