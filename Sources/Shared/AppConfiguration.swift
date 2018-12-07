//
//  AppConfiguration.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/9/18.
//

import UIKit
import CoreGraphics

open class AppConfiguration{

	open var layout: AppLayoutGuide = AppLayoutGuide()
	open var style: AppStyleGuide = AppStyleGuide()
    open var orientation: UIInterfaceOrientationMask = [.all]
	
    public required init(){
		didInit()
	}
	open func didInit(){

	}
}


open class AppLayoutGuide{
	open var roundedCornerRadius: CGFloat = 3.0	
}
