//
//  _LBCircularPulseShapeLayer.swift
//  LBCircularPulsesView
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class _LBCircularPulseShapeLayer: CAShapeLayer {
    
    private(set) var _animation: _LBCircularPulseAnimation = {
        _LBCircularPulseAnimation()
    }()
    
    internal var color: UIColor? = .white {
        didSet { super.fillColor = color?.cgColor }
    }
    
    internal var toOpacity: NSNumber = 0.0 {
        didSet {  }
    }
    
    internal var fromOpacity: NSNumber = 1.0 {
        didSet {  }
    }

    internal var pulsesScale: NSNumber = 1.7 {
        didSet {  }
    }
    
    override var frame: CGRect {
        didSet { setup() }
    }
    
    override init() {
        super.init()
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    fileprivate func setup() {
        super.path      = path().cgPath
        super.fillColor = color?.cgColor
    }
    
    fileprivate func path() -> UIBezierPath {
        let c = CGPoint(x: bounds.midX, y: bounds.midY)
        let r = (frame.height/2)
        let s = (CGFloat.pi / 2)
        let e = (CGFloat.pi * 2)
        /*
         * */
        return UIBezierPath(arcCenter: c, radius: r, startAngle: -s, endAngle: e, clockwise: true)
    }
    
    internal func stopAnimation() {
        removeAllAnimations()
    }
    
    internal func startAnimation(duration: Double, beginTime: Double) {
        _animation.start(layer:       self,
                         duration:    duration,
                         beginTime:   beginTime,
                         toOpacity:   toOpacity,
                         fromOpacity: fromOpacity,
                         pulsesScale: pulsesScale)
    }
}



