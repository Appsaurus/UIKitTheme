//
//  StatusBarStyleable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/29/18.
//

import UIKit
import DarkMagic

public protocol StatusBarConfigurable: class{
    var statusBarConfiguration: StatusBarConfiguration { get }
}

private extension AssociatedObjectKeys{
    static let statusBarStyle = AssociatedObjectKey<UIStatusBarStyle>("statusBarStyle")
    static let statusBarHidden = AssociatedObjectKey<Bool>("statusBarHidden")
    static let statusBarAnimation = AssociatedObjectKey<UIStatusBarAnimation>("statusBarAnimation")
}

public extension StatusBarConfigurable where Self: UIViewController{
    
    public var statusBarStyle: UIStatusBarStyle{
        get{
            return getAssociatedObject(forKey: .statusBarStyle, initialValue: statusBarConfiguration.style)
        }
        set{
            setAssociatedObject(newValue, forKey: .statusBarStyle)
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    public var statusBarHidden: Bool{
        get{
            return getAssociatedObject(forKey: .statusBarHidden, initialValue: statusBarConfiguration.hidden)
        }
        set{
            setAssociatedObject(newValue, forKey: .statusBarHidden)
            setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    public var statusBarAnimation: UIStatusBarAnimation{
        get{
            return getAssociatedObject(forKey: .statusBarAnimation, initialValue: statusBarConfiguration.animation)
        }
        set{
            setAssociatedObject(newValue, forKey: .statusBarAnimation)
        }
    }
}
