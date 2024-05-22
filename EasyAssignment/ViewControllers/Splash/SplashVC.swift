//
//  SplashVC.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation
import LBCircularPulsesView

class SplashVC: UIViewController {
    
    @IBOutlet weak var pulsesView:  LBCircularPulsesView!
    @IBOutlet weak var popcornView: PopcornView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        popcornView.stop()
        pulsesView.stop()
    }
    
    @IBAction func startTouch(_ sender: UIButton) {
        MoviesVC.show(over: self)
    }
}
