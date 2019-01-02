//
//  AppStyleManager.swift
//  Pods
//
//  Created by Brian Strobach on 8/10/16.
//
//

#if canImport(UIKit)
import UIKitExtensions

public protocol Styleable: class {
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

    public var currentStyle: AppStyleGuide {
        return App.style
    }
    public static var currentStyle: AppStyleGuide {
        return App.style
    }

    public func styleDidChange(notification: Notification) {
        self.style()
    }
}

public extension Styleable where Self: NSObject {
    public func bindStyle() {
        on(.appStyleDidChange, closure: style)
        self.style()
    }
}

#endif
