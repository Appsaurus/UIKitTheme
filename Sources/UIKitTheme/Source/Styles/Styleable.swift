//
//  AppStyleManager.swift
//  Pods
//
//  Created by Brian Strobach on 8/10/16.
//
//

#if canImport(UIKit)
import UIKitExtensions

public protocol Styleable: AnyObject {
    func style()
}

extension Array where Element: Styleable {
    public func style() {
        forEach({$0.style()})
    }
}

extension Notification.Name {
    static public let appStyleDidChange = Notification.Name("appStyleDidChange")
}

public extension Styleable {

    var currentStyle: AppStyleGuide {
        return App.style
    }
    static var currentStyle: AppStyleGuide {
        return App.style
    }

    func styleDidChange(notification: Notification) {
        self.style()
    }
}

public extension Styleable where Self: NSObject {
    func bindStyle() {
        on(.appStyleDidChange) { [weak self] (_) in
            self?.style()
        }
        self.style()
    }
}

#endif
