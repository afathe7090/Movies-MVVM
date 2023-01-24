//
//  UIView+Shadow.swift
//  Movies
//
//  Created by Ahmed Fathy on 21/01/2023.
//

import Foundation
import UIKit
extension UIImageView {
    func staticShadow(with radius: CGFloat) {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = radius
        layer.shadowOpacity = 0.19
        layer.shadowOffset = .init(width: 0, height: 2)
        clipsToBounds = true
        layer.masksToBounds = true
    }
}

extension UIView {
    func cornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
    }
}
