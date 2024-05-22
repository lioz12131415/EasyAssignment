//
//  UIImageView.swift
//  EasyAssignment
//
//  Created by ליעוז בלקי on 22/05/2024.
//

import UIKit
import SDWebImage
import Foundation

extension UIImageView {
    // ============================================== //
    // MARK: -
    // ============================================== //
    internal func sd_contains(_ url: URL) -> Bool {
        guard let key = SDWebImageManager.shared.cacheKey(for: url) else {
            return false
        }
        return SDImageCache.shared.diskImageDataExists(withKey: key)
    }
}

extension UIImageView {
    // ============================================== //
    // MARK: -
    // ============================================== //
    internal func setImage(_ url: URL, _ completion: (() -> Void)? = nil) {
        sd_cancelCurrentImageLoad()
        sd_setImage(with: url) { image, error, _, _ in
            completion?()
        }
    }
}
