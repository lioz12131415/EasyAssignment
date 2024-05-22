//
//  LBCircularPulsesView.swift
//  LBCircularPulsesView
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

public class LBCircularPulsesView: UIView {
    
    fileprivate lazy var generator: _LBCircularPulsesGenerator = _LBCircularPulsesGenerator()
    
    @IBInspectable public var toOpacity: CGFloat = 0.0 {
        didSet { generator.update(toOpacity: toOpacity as NSNumber) }
    }
    
    @IBInspectable public var fromOpacity: CGFloat = 1.0 {
        didSet { generator.update(fromOpacity: fromOpacity as NSNumber) }
    }

    @IBInspectable public var pulsesScale: CGFloat = 1.7 {
        didSet { generator.update(pulsesScale: pulsesScale as NSNumber) }
    }
    
    @IBInspectable public var pulsesColor: UIColor = .white {
        didSet { generator.update(color: pulsesColor) }
    }
    
    @IBInspectable public var pulsesCount: Int = 1 {
        didSet { setup() }
    }
    
    public override func awakeFromNib() {
        super.awakeFromNib()
        self.start()
    }
    
    public func stop() {
        generator.stop()
    }
    
    public func start() {
        generator.stop { [weak self] in
            self?.generator.start()
        }
    }
    
    fileprivate func setup() {
        generator.generate(view:        self,
                           count:       pulsesCount,
                           color:       pulsesColor,
                           toOpacity:   toOpacity   as NSNumber,
                           fromOpacity: fromOpacity as NSNumber,
                           pulsesScale: pulsesScale as NSNumber)
    }
}


