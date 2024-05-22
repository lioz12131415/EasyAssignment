//
//  _LBCircularPulseView.swift
//  LBCircularPulsesView
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class _LBCircularPulseView: UIView {
    
    private(set) var _shapeLayer: _LBCircularPulseShapeLayer = {
        _LBCircularPulseShapeLayer()
    }()
    
    override var frame: CGRect {
        didSet { _shapeLayer.frame = frame }
    }
    
    override var bounds: CGRect {
        didSet { _shapeLayer.frame = bounds }
    }
    
    override var backgroundColor: UIColor? {
        get { .clear                       }
        set { _shapeLayer.color = newValue }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    override func removeFromSuperview() {
        super.removeFromSuperview()
        self.stop()
    }
    
    convenience init(frame:           CGRect,
                     color:           UIColor,
                     toOpacity:       NSNumber,
                     fromOpacity:     NSNumber,
                     pulsesScale:     NSNumber) {
        self.init(frame: frame)
        self._shapeLayer.color       = color
        self._shapeLayer.opacity     = .zero
        self._shapeLayer.toOpacity   = toOpacity
        self._shapeLayer.fromOpacity = fromOpacity
        self._shapeLayer.pulsesScale = pulsesScale
    }
    
    fileprivate func setup() {
        super.backgroundColor = .clear
        super.layer.addSublayer(_shapeLayer)
    }
    
    internal func stop() {
        _shapeLayer.stopAnimation()
    }
    
    internal func start(duration: Double, beginTime: Double) {
        _shapeLayer.startAnimation(duration: duration, beginTime: beginTime)
    }
}
