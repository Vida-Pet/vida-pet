//
//  UIView+.swift
//  Vida Pet
//
//  Created by João Pedro Giarrante on 19/10/20.
//  Copyright © 2020 João Pedro Giarrante. All rights reserved.
//

import UIKit

extension UIView {
    func dropShadow(offsetX: CGFloat, offsetY: CGFloat, color: UIColor, opacity: Float, radius: CGFloat, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowRadius = radius
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}
