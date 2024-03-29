//
//  StatusBarStyleable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/29/18.
//

import UIKit
import DarkMagic

public protocol StatusBarConfigurable: AnyObject {
    var statusBarConfiguration: StatusBarConfiguration { get }
}

private extension AssociatedObjectKeys {
    static let statusBarStyle = AssociatedObjectKey<UIStatusBarStyle>("statusBarStyle")
    static let statusBarHidden = AssociatedObjectKey<Bool>("statusBarHidden")
    static let statusBarAnimation = AssociatedObjectKey<UIStatusBarAnimation>("statusBarAnimation")
}

public extension StatusBarConfigurable where Self: UIViewController {
    
    var statusBarStyle: UIStatusBarStyle {
        get {
            return getAssociatedObject(for: .statusBarStyle, initialValue: self.statusBarConfiguration.style)
        }
        set {
            setAssociatedObject(newValue, for: .statusBarStyle)
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    var statusBarHidden: Bool {
        get {
            return getAssociatedObject(for: .statusBarHidden, initialValue: self.statusBarConfiguration.hidden)
        }
        set {
            setAssociatedObject(newValue, for: .statusBarHidden)
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    var statusBarAnimation: UIStatusBarAnimation {
        get {
            return getAssociatedObject(for: .statusBarAnimation, initialValue: self.statusBarConfiguration.animation)
        }
        set {
            setAssociatedObject(newValue, for: .statusBarAnimation)
        }
    }
}
