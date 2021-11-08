//
//  RoundableMixin.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 12/3/18.
//

import UIKitMixinable

open class RoundableMixin<RoundableView>: UIViewMixin<RoundableView> where RoundableView: UIView & Roundable {
    open override func layoutSubviews() {
        guard let mixable = self.mixable else { return }
        if mixable.rounded {
            mixable.roundCorners()
        }
    }
}
