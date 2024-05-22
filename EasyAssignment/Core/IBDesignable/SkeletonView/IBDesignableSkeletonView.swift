//
//  IBDesignableSkeletonView.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

@IBDesignable
class IBDesignableSkeletonView: IBDesignableView {
    
    var delay:       CFTimeInterval = 0
    var duration:    CFTimeInterval = 2
    
    var endLocations:   [NSNumber] = [1.0, 1.5, 10.0]
    var startLocations: [NSNumber] = [-1.0, -0.5, 0.0]
    
    var movingColor:   CGColor = UIColor(white: 1, alpha: 0.80).cgColor
    var gradientColor: CGColor = UIColor(white: 1, alpha: 0.40).cgColor
    
    lazy var gradientLayer: CAGradientLayer = {
        return CAGradientLayer()
    }()
        
    @IBInspectable var color: UIColor = .white {
        didSet { set(color: color) }
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        setup()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientLayer.frame = bounds
        gradientLayer.removeAllAnimations()
        setup()
    }
    
    internal func start(isHidden: Bool = false) {
        self.isHidden = isHidden
        setup()
    }
    
    internal func stop(isHidden: Bool = false) {
        self.isHidden = isHidden
        self.gradientLayer.removeAllAnimations()
    }
    
    fileprivate func set(color: UIColor) {
        movingColor   = color.withAlphaComponent(0.70).cgColor
        gradientColor = color.withAlphaComponent(0.55).cgColor
    }
    
    fileprivate func locations() -> CABasicAnimation {
        let animation                   = CABasicAnimation(keyPath: "locations")
        animation.fromValue             = startLocations
        animation.toValue               = endLocations
        animation.duration              = duration
        animation.timingFunction        = CAMediaTimingFunction(name: .easeInEaseOut)
        animation.isRemovedOnCompletion = false
        return animation
    }
    
    fileprivate func group(_ animation: CABasicAnimation) -> CAAnimationGroup {
        let group                   = CAAnimationGroup()
        group.duration              = duration + delay
        group.animations            = [animation]
        group.repeatCount           = .infinity
        group.isRemovedOnCompletion = false
        return group
    }
    
    fileprivate func setup() {
        let locations = locations()
        let group     = group(locations)
        
        gradient()
        gradientLayer.add(group, forKey: locations.keyPath)
    }
    
    fileprivate func gradient()  {
        gradientLayer.frame      = bounds
        gradientLayer.endPoint   = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.startPoint = CGPoint(x: 0.0, y: 1.0)
        
        gradientLayer.colors = [
            gradientColor,
            movingColor,
            gradientColor
        ]
        gradientLayer.locations = startLocations
        gradientLayer.removeFromSuperlayer()
        layer.addSublayer(gradientLayer)
    }
    
    deinit {
        gradientLayer.removeFromSuperlayer()
        gradientLayer.removeAllAnimations()
    }
}


