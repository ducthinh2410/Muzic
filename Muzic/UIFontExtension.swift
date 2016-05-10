
//
//  UIFontExtension.swift
//  Muzic
//
//  Created by Thinh Duc on 09/05/16.
//  Copyright © 2016 Thinh Duc. All rights reserved.
//

extension UIFont {
    class func appFont(fontSize: CGFloat) -> UIFont {
        return UIFont.systemFontOfSize(fontSize)
    }
    
    class func boldAppFont(fontSize: CGFloat) -> UIFont {
        return UIFont.boldSystemFontOfSize(fontSize)
    }
}