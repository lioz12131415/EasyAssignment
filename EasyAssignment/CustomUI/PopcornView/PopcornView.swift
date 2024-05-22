//
//  PopcornView.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class PopcornView: UIView {
    
    fileprivate var emitterCell:  CAEmitterCell?  = nil
    fileprivate var emitterLayer: CAEmitterLayer? = nil
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    internal func stop() {
        emitterCell?.lifetime  = 0.0
        emitterLayer?.lifetime = 0.0
    }
    
    internal func start() {
        emitterCell?.lifetime  = 10.0
        emitterLayer?.lifetime = 1.0
    }
    
    fileprivate func setup() {
        emitterCell                = emitter_cell()
        emitterLayer               = emitter_layer()
        emitterLayer?.emitterCells = [emitterCell!]
        layer.addSublayer(emitterLayer!)
    }
    
    fileprivate func emitter_layer() -> CAEmitterLayer {
        let layer = CAEmitterLayer()
        
        layer.frame           = CGRect(x: 0.0, y: 0.0, width:  frame.width, height: frame.height)
        layer.renderMode      = .oldestLast
        layer.emitterMode     = .surface
        layer.emitterShape    = .circle
        layer.emitterSize     = .init(width: 1648.0, height: 1112.0)
        layer.emitterPosition = .init(x: 509.4, y: 707.7)
        
        return layer
    }
    
    fileprivate func emitter_cell() -> CAEmitterCell {
        let cell = CAEmitterCell()
        
        cell.contents      = UIImage(named: "single_popcorn_icon")?.cgImage
        cell.name          = UUID().uuidString
        cell.birthRate     = 40.0
        cell.lifetime      = 10.0
        cell.velocity      = 59.0
        cell.velocityRange = -15.0
        cell.xAcceleration = 5.0
        cell.yAcceleration = 40.0
        cell.emissionRange = 180.0 * (.pi / 180.0)
        cell.spin          = -28.6 * (.pi / 180.0)
        cell.spinRange     = 57.2 * (.pi / 180.0)
        cell.scale         = 0.06
        cell.scaleRange    = 0.1
        
        return cell
    }
}
