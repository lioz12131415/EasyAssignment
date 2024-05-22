//
//  MovieCellNoDataView.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

class MovieCellNoDataView: UIView {
    
    @IBOutlet var skeletons: [IBDesignableSkeletonView]!
    
    internal var isRunning: Bool = true
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    internal func stop() {
        guard isRunning else {
            return
        }
        isRunning.toggle()
        skeletons.forEach { $0.stop() }
    }
    
    internal func start() {
        guard !isRunning else {
            return
        }
        isRunning.toggle()
        skeletons.forEach { $0.start() }
    }
    
    internal class func loadNib() -> MovieCellNoDataView  {
        let nib  = UINib(nibName: "MovieCellNoDataView", bundle: Bundle(for: self))
        let view = nib.instantiate(withOwner: nil, options: nil)[0] as! MovieCellNoDataView
        return view
    }
}
