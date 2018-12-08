//
//  NavigationBarStyleable.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 11/28/18.
//

import UIKit
import DarkMagic
import UIKitExtensions

public extension UIViewController {
    public func applyNavigationBar(style: NavigationBarStyle){
        
        guard let selfNav = self as? UINavigationController else{
            navigationController?.navigationBar.apply(navigationBarStyle: style)
            return
        }
        selfNav.navigationBar.apply(navigationBarStyle: style)
    }
}

public protocol NavigationBarStyleable: class{
    var navigationBarStyle: NavigationBarStyle? { get set }
    func animateToDefaultNavigationBarStyle()
    func applyDefaultNavigationBarStyle()
}


private extension AssociatedObjectKeys{
    static let navigationBarStyle = AssociatedObjectKey<NavigationBarStyle>("navigationBarStyle")
}

public extension NavigationBarStyleable where Self: NSObject{
    
    public var navigationBarStyle: NavigationBarStyle?{
        get{
            return self[.navigationBarStyle]
        }
        set{
            self[.navigationBarStyle] = newValue
            applyDefaultNavigationBarStyle()
        }
    }
    
}
public extension NavigationBarStyleable where Self: UIViewController{
    public func applyDefaultNavigationBarStyle(){
        guard let parent = self.parent, parent === navigationController else { return }
        guard let style = navigationBarStyle else { return }
        self.applyNavigationBar(style: style)
    }
    public func animateToDefaultNavigationBarStyle(){
        guard let parent = self.parent, parent === navigationController else { return }
        guard let style = navigationBarStyle else { return }
        
        
        guard let transitionCoordinator = transitionCoordinator else {
            self.applyNavigationBar(style: style)
            return
        }
        let destinationVC = transitionCoordinator.toViewController
        
        transitionCoordinator.animate(alongsideTransition: { (context) in
            destinationVC.applyNavigationBar(style: style)
            }, completion: nil)
    }
}
