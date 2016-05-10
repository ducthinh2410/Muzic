
//
//  NSAttributedString.swift
//  Muzic
//
//  Created by Thinh Duc on 09/05/16.
//  Copyright © 2016 Thinh Duc. All rights reserved.
//

import Foundation

extension NSAttributedString {
    //Return new attributed string
    class func attributedStringFromFont(string : String, font: UIFont, textColor: UIColor, textAlignment: NSTextAlignment?) -> NSAttributedString {
        if let _textAlignment = textAlignment {
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.alignment = _textAlignment
            return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: textColor, NSFontAttributeName: font, NSParagraphStyleAttributeName: paragraphStyle])
        }
        return NSAttributedString(string: string, attributes: [NSForegroundColorAttributeName: textColor, NSFontAttributeName: font])
    }
    
    //Calculate height for an attributed string
    func heightInWidth(width: CGFloat) -> CGFloat {
        let framesetter = CTFramesetterCreateWithAttributedString(self)
        var fitRange = CFRange()
        let size = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRangeMake(0, 0), nil, CGSize(width: width, height:  CGFloat.max), &fitRange)
        
        return size.height
    }
}