//
//  UIFont+init.swift
//  StaticWeatherApp
//
//  Created by Yusuke on 2020/04/24.
//  Copyright © 2020年 usk83. All rights reserved.
//

import UIKit

enum TextWeight {
    case normal
    case bold
}

private let normalFontName = "HelveticaNeue"
private let boldFontName = "HelveticaNeue-Bold"

extension UIFont {
    convenience init?(size: CGFloat) {
        self.init(name: normalFontName, size: size)
    }

    convenience init?(size: CGFloat, weight: TextWeight) {
        switch weight {
        case .bold:
            self.init(name: boldFontName, size: size)
        default:
            self.init(name: normalFontName, size: size)
        }
    }
}
