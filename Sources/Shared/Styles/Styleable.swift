//
//  AppStyleManager.swift
//  Pods
//
//  Created by Brian Strobach on 8/10/16.
//
//

import Foundation

//import DynamicColor

public protocol Styleable: class {
    func style()
}

extension Array where Element: Styleable {
	public func style() {
		forEach({$0.style()})
	}
}

extension Notification.Name {
	static public let appStyleDidChangeNotification = Notification.Name("appStyleDidChangeNotification")
}

public extension Styleable {

	public var currentStyle: AppStyleGuide {
        return App.style
	}
	public static var currentStyle: AppStyleGuide {
        return App.style
	}

	public func bindStyle() {

		//Only bind one style at a time
		NotificationCenter.default.removeObserver(self, name: .appStyleDidChangeNotification, object: nil)

		NotificationCenter.default.addObserver(forName: .appStyleDidChangeNotification,
                                               object: nil,
                                               queue: OperationQueue.main,
                                               using: styleDidChange)
		self.style()
	}
    
    public func styleDidChange(notification: Notification) {
        self.style()
    }
}

//extension Styleable{
//    public static func mixin(_ mixinable: UIView & Styleable) -> StyleableViewMixin{
//        return StyleableViewMixin(mixinable)
//    }
//    
//    public static func mixin(_ mixinable: UIViewController & Styleable) -> StyleableViewControllerMixin{
//        return StyleableViewControllerMixin(mixinable)
//    }
//}
