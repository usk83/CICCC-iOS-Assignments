//
//  UILabel+init.swift
//  StaticWeatherApp
//
//  Created by Yusuke on 2020/04/24.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

extension UILabel {
    convenience init(text: String, textAlignment: NSTextAlignment) {
        self.init()
        self.text = text
        self.textAlignment = textAlignment
    }

    convenience init(text: String, textAlignment: NSTextAlignment, textSize: CGFloat) {
        self.init(text: text, textAlignment: textAlignment)
        self.font = UIFont(size: textSize)
    }

    convenience init(text: String, textAlignment: NSTextAlignment, textSize: CGFloat, textWeight: TextWeight) {
        self.init(text: text, textAlignment: textAlignment)
        self.font = UIFont(size: textSize, weight: textWeight)
    }
}
