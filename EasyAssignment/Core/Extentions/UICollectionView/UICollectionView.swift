//
//  UICollectionView.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import Foundation

extension UICollectionView {
    // ============================================== //
    // MARK: -
    // ============================================== //
    internal var visibles: [UICollectionViewCell] {
        guard let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else {
            return []
        }
        let rect  = CGRect(origin: contentOffset, size: frame.size)
        let cells = visibleCells.filter { $0.frame.intersects(rect) }
        
        switch flowLayout.scrollDirection {
            case .vertical:   return cells.sorted(by: { $0.frame.origin.y < $1.frame.origin.y })
            case .horizontal: return cells.sorted(by: { $0.frame.origin.x < $1.frame.origin.x })
        default:
            return []
        }
    }
}
