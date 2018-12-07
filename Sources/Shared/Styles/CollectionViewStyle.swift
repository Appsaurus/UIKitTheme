//
//  CollectionViewStyle.swift
//  AppsaurusUIKit
//
//  Created by Brian Strobach on 3/10/18.
//

import UIKit

open class CollectionViewStyle: Style{

	open var viewStyle: ViewStyle

	public init(viewStyle: ViewStyle) {
		self.viewStyle = viewStyle		
	}

}

public protocol CollectionViewStyleable{
	func apply(collectionViewStyle style: CollectionViewStyle)
}

extension UICollectionView: CollectionViewStyleable{
	public func apply(collectionViewStyle style: CollectionViewStyle){
		 apply(viewStyle: style.viewStyle, optimizeRendering: false)
	}
}
