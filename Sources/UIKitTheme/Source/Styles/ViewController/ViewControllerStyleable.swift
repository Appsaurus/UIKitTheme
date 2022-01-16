//
//  ViewControllerStyleable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/29/18.
//

import Foundation

public protocol ViewControllerStyleable: Styleable {
    var viewControllerStyle: ViewControllerStyle { get set }
    func apply(viewControllerStyle: ViewControllerStyle)
    
}
