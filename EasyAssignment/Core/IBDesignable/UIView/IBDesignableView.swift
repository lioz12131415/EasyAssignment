//
//  IBDesignableView.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

@IBDesignable
class IBDesignableView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet { corners() }
    }
    
    @IBInspectable var leftTopCorners: Bool = false {
        didSet { corners() }
    }

    @IBInspectable var rightTopCorners: Bool = false {
        didSet { corners() }
    }
    
    @IBInspectable var leftBottomCorners: Bool = false {
        didSet { corners() }
    }
    
    @IBInspectable var rightBottomCorners: Bool = false {
        didSet { corners() }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    @IBInspectable var borderColor: UIColor {
        set { layer.borderColor = newValue.cgColor }
        get { return UIColor(cgColor: layer.borderColor ?? UIColor.clear.cgColor) }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 12, height: 12) {
        didSet { layer.shadowOffset = shadowOffset }
    }
    
    @IBInspectable var shadowPlusSize: CGSize = CGSize.zero {
        didSet { updateShadow() }
    }
    
    @IBInspectable var shadowColor: UIColor = UIColor.gray {
        didSet { layer.shadowColor = shadowColor.cgColor }
    }
    
    @IBInspectable var shadowOpacity: Float = 1.0 {
        didSet { layer.shadowOpacity = shadowOpacity }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 1.0 {
        didSet { layer.shadowRadius = shadowRadius }
    }
    
    @IBInspectable var shadowPath: Bool = false {
        didSet { updateShadow() }
    }
    
    override var bounds: CGRect {
        didSet { updateShadow() }
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
    }
    
    fileprivate func corners() {
        var rectCorner = CACornerMask()
        
        if leftTopCorners     { rectCorner.insert(.layerMinXMinYCorner) }
        if rightTopCorners    { rectCorner.insert(.layerMaxXMinYCorner) }
        if leftBottomCorners  { rectCorner.insert(.layerMinXMaxYCorner) }
        if rightBottomCorners { rectCorner.insert(.layerMaxXMaxYCorner) }
        
        layer.cornerRadius  = cornerRadius
        layer.maskedCorners = rectCorner
    }
    
    fileprivate func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let size = CGSize(width: radius, height: radius)
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: size)
        let mask = CAShapeLayer()
        
        mask.path  = path.cgPath
        layer.mask = mask
    }
    
    fileprivate func updateShadow() {
        guard shadowPath else {
            return
        }
        self.layer.shadowPath = UIBezierPath(rect: .init(x:      bounds.origin.x,
                                                         y:      bounds.origin.y,
                                                         width:  bounds.width+shadowPlusSize.width,
                                                         height: bounds.height+shadowPlusSize.height)).cgPath
    }
}



