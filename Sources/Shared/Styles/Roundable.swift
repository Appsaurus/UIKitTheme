//
//  Roundable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKit
import DarkMagic

//For views that need to round their corners after resizing their layout
public protocol Roundable: class {
    var rounded: Bool { get set }
}

private extension AssociatedObjectKeys {
    static let rounded = AssociatedObjectKey<Bool>("rounded")
}

public extension Roundable where Self: UIView {
    
    var rounded: Bool {
        get {
            return getAssociatedObject(for: .rounded, initialValue: false)
        }
        set {
            setAssociatedObject(newValue, for: .rounded)
        }
    }
}
