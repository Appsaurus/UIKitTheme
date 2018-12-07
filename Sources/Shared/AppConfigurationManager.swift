//
//  AppConfigurationManager.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/13/18.
//

import UIKit

open class App{

    public static var configuration: AppConfiguration{
		return AppConfigurationManager.shared.configuration
	}

	//MARK: Conveniene Accessors
    public static var layout: AppLayoutGuide{
		return configuration.layout
	}

    public static var style: AppStyleGuide{
		return configuration.style
	}

    public static var colors: ColorScheme{
		return style.colors
	}
}

open class AppConfigurationManager{
	public static let shared = AppConfigurationManager()
	open lazy var configuration: AppConfiguration = AppConfiguration()

	open func apply(configuration: AppConfiguration, refreshAppImmediately: Bool = false){
		self.configuration = configuration
		style()
		if refreshAppImmediately{
			DispatchQueue.main.async{
				NotificationCenter.post(name: .appStyleDidChangeNotification)
                UIApplication.shared.refreshAllViews()
			}
		}
	}


	fileprivate func style(){
		self.configuration.style.applyAppearanceProxySettings()
		ViewShape.roundedRectCornerRadius = configuration.layout.roundedCornerRadius
	}

	//	open func applyKeyboardStyle(_ style: AppStyleGuide){
	//		UITextField.appearance().keyboardAppearance = style.keyboardAppearance
	//	}

}

internal extension UIApplication{
    internal func refreshAllViews(){
        for window in self.windows{
            for view in window.subviews{
                view.removeFromSuperview()
                window.addSubview(view)
            }
        }
    }
}
