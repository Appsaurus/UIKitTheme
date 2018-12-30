//
//  RoundableMixin.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKitMixinable

open class RoundableMixin: UIViewMixin<Roundable & UIView> {
    open override func layoutSubviews() {
        if mixable.rounded {
            mixable.roundCorners()
        }
    }
}
