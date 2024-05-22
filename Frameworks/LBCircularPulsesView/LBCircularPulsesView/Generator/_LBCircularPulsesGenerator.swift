//
//  _LBCircularPulsesGenerator.swift
//  LBCircularPulsesView
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class _LBCircularPulsesGenerator {
    
    internal var values: [_LBCircularPulseView] = []
    
    internal func update(color: UIColor) {
        values.forEach { $0._shapeLayer.color = color }
    }
    
    internal func update(toOpacity: NSNumber) {
        values.forEach { $0._shapeLayer.toOpacity = toOpacity }
    }
    
    internal func update(fromOpacity: NSNumber) {
        values.forEach { $0._shapeLayer.fromOpacity = fromOpacity }
    }
    
    internal func update(pulsesScale: NSNumber) {
        values.forEach { $0._shapeLayer.pulsesScale = pulsesScale }
    }
    
    internal func generate(view:      UIView,
                           count:       Int,
                           color:       UIColor,
                           toOpacity:   NSNumber,
                           fromOpacity: NSNumber,
                           pulsesScale: NSNumber) {
        values.forEach { $0.removeFromSuperview() }
        values.removeAll()
        
        for _ in 0..<count {
            let v = _LBCircularPulseView(frame:       view.bounds,
                                         color:       color,
                                         toOpacity:   toOpacity,
                                         fromOpacity: fromOpacity,
                                         pulsesScale: pulsesScale)
            values.append(v)
            view.addSubview(v)
        }
    }
    
    internal func start() {
        let values       = values
        let values_count = values.count
        
        for i in 0..<values.count {
            values[i].start(duration: Double(values_count), beginTime: Double(i)*1.0)
        }
    }
    
    internal func stop(_ block: (() -> Void)?=nil) {
        for i in 0..<values.count {
            values[i].stop()
        }
        block?()
    }
}


