//
//  NavigationBarStyle.swift
//  Pods
//
//  Created by Brian Strobach on 4/20/17.
//
//

import Foundation
import UIKit

open class NavigationBarStyle: Style {
    open var barColor: UIColor?
    open var backgroundImage: UIImage?
    open var gradient: GradientConfiguration?
    open var titleTextStyle: TextStyle
    open var opaque: Bool
    open var translucent: Bool
    open var transparent: Bool
    open var hidesBottomHairline: Bool
    
    public init(barColor: UIColor? = nil,
                backgroundImage: UIImage? = nil,
                gradient: GradientConfiguration? = nil,
                titleTextStyle: TextStyle? = nil,
                opaque: Bool = true,
                translucent: Bool = false,
                transparent: Bool = false,
                hidesBottomHairline: Bool = false) {
        self.barColor = barColor
        self.backgroundImage = backgroundImage
        self.gradient = gradient
        self.titleTextStyle = titleTextStyle ?? .regular(size: .navigationBarTitle)
        self.opaque = transparent ? false : opaque
        self.translucent = translucent
        self.transparent = transparent
        self.hidesBottomHairline = transparent ? true : hidesBottomHairline
    }
}

extension UINavigationBar {
    
    public func apply(navigationBarStyle style: NavigationBarStyle, appearanceProxyFriendly: Bool = false) {
        
        let navBar = self
        if !appearanceProxyFriendly {
            if style.transparent {
                navBar.makeTransparent()
            } else {
                resetToDefaultStyle()
                navBar.setBackgroundImage(style.backgroundImage, for: .default)
            }
            navBar.hairlineBottomBorder?.isHidden = style.hidesBottomHairline
            navBar.setNeedsDisplay()
        }
        if !style.transparent {
            navBar.isTranslucent = style.translucent
            navBar.isOpaque = style.opaque
            navBar.barTintColor = style.barColor
            navBar.tintColor = style.titleTextStyle.color
        }
        navBar.barStyle = .default
        
        let textAttributes = style.titleTextStyle.attributeDictionary
        navBar.titleTextAttributes = textAttributes
        if #available(iOS 11.0, *) {
            navBar.largeTitleTextAttributes = textAttributes
        }
        
        if let gradient = style.gradient {
            var frameAndStatusBar: CGRect = self.bounds
            frameAndStatusBar.size.width = min(UIScreen.screenWidth, frameAndStatusBar.size.width)
            frameAndStatusBar.size.height += UIApplication.shared.statusBarFrame.height
            //            navBar.barTintColor = gradient.toColor(frame: frameAndStatusBar)
            navBar.setBackgroundImage(gradient.toImage(frame: frameAndStatusBar)?.resizableImage(withCapInsets: .zero, resizingMode: .stretch), for: .default)
            
            navBar.barTintColor = .clear
            navBar.tintColor = .clear
        }
        
    }
}

extension UINavigationBar {
    
    public var hairlineBottomBorder: UIImageView? {
        return self.firstSubview(matching: { (subview) -> Bool in
            return subview is UIImageView && subview.bounds.height <= 1.0
        }) as? UIImageView
        //        if view.isKindOfClass(UIImageView) && view.bounds.height <= 1.0 {
        //            return (view as! UIImageView)
        //        }
        //
        //        for subview: UIView in view.subviews {
        //            if let imageView: UIImageView = hairlineBottomBorderInNavigationBar(subview) {
        //                return imageView
        //            }
        //        }
        //
        //        return nil
    }
    
    public func makeTransparent() {
        self.setBackgroundImage(UIImage(), for: .default)
        self.shadowImage = UIImage()
        self.backgroundColor = nil// UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.0)
        self.isTranslucent = true
        self.isOpaque = false
        //        self.hideBottomHairline()
    }
    
    public func resetToDefaultStyle() {
        self.isTranslucent = false
        self.setBackgroundImage(nil, for: .default)
        self.backgroundColor = nil
        self.shadowImage = nil
        hairlineBottomBorder?.isHidden = false
    }
    
    //    /// Applies a background gradient with the given colors
    //    public func apply(gradient colors : [UIColor]) {
    //        var frameAndStatusBar: CGRect = self.bounds
    //        frameAndStatusBar.size.height += UIApplication.shared.statusBarFrame.height
    //        setBackgroundImage(self.gradient(size: frameAndStatusBar.size, colors: colors), for: .default)
    //    }
    
    //    /// Creates a gradient image with the given settings
    //    static func gradient(size : CGSize, colors : [UIColor]) -> UIImage?
    //    {
    //        // Turn the colors into CGColors
    //        let cgcolors = colors.map { $0.cgColor }
    //
    //        // Begin the graphics context
    //        UIGraphicsBeginImageContextWithOptions(size, true, 0.0)
    //
    //        // If no context was retrieved, then it failed
    //        guard let context = UIGraphicsGetCurrentContext() else { return nil }
    //
    //        // From now on, the context gets ended if any return happens
    //        defer { UIGraphicsEndImageContext() }
    //
    //        // Create the Coregraphics gradient
    //        var locations : [CGFloat] = [0.0, 1.0]
    //        guard let gradient = CGGradient(colorsSpace: CGColorSpaceCreateDeviceRGB(), colors: cgcolors as NSArray as CFArray, locations: &locations) else { return nil }
    //
    //        // Draw the gradient
    //        context.drawLinearGradient(gradient, start: CGPoint(x: 0.0, y: 0.0), end: CGPoint(x: size.width, y: 0.0), options: [])
    //
    //        // Generate the image (the defer takes care of closing the context)
    //        return UIGraphicsGetImageFromCurrentImageContext()
    //    }
    
}
