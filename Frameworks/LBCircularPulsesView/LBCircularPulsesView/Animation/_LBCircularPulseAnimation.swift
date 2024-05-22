//
//  _LBCircularPulseAnimation.swift
//  LBCircularPulsesView
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class _LBCircularPulseAnimation {
    /*
     *
     * * */
    internal func start(layer:       CALayer,
                        duration:    Double,
                        beginTime:   Double,
                        toOpacity:   NSNumber,
                        fromOpacity: NSNumber,
                        pulsesScale: NSNumber) {
        let scale = _animate(keyPath:      "transform.scale",
                             toValue:       pulsesScale,
                             fromValue:     1.0,
                             durationValue: duration)
        
        let opacity = _animate(keyPath:      "opacity",
                               toValue:       toOpacity,
                               fromValue:     fromOpacity,
                               durationValue: duration)
        
        _group(layer: layer, duration: duration, beginTime: beginTime, animations: [scale, opacity])
    }
    /*
     *
     * * */
    fileprivate func _animate(keyPath:       String,
                              toValue:       NSNumber,
                              fromValue:     NSNumber,
                              durationValue: CFTimeInterval) -> CABasicAnimation {
        
        let animation       = CABasicAnimation(keyPath: keyPath)
        animation.toValue   = toValue
        animation.fromValue = fromValue
        animation.duration  = durationValue
        animation.isRemovedOnCompletion = false

        return animation
    }
    /*
     *
     * * */
    fileprivate func _group(layer:      CALayer,
                            duration:   Double,
                            beginTime:  Double,
                            animations: [CAAnimation]) {
       
        let group         = CAAnimationGroup()
        group.beginTime   = CACurrentMediaTime() + beginTime
        group.duration    = duration
        group.repeatCount = .infinity
        group.animations  = animations
        group.isRemovedOnCompletion = false
        
        layer.add(group, forKey: "pulse")
    }
}


