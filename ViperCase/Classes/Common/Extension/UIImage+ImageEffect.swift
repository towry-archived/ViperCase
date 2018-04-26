//
//  UIImage+ImageEffect.swift
//  ViperCase
//
//  Created by towry on 2018/4/26.
//  Copyright © 2018年 towry. All rights reserved.
//

import Foundation
import UIKit
import Accelerate
import CoreGraphics

extension UIImage {
    func applyDarkEffect() -> UIImage? {
        let tintColor = UIColor(white: 0.11, alpha: 0.9)
        return self.applyBlurWithRadius(40, tintColor: tintColor, saturationDeltaFactor: 4.8, maskImage: nil)
    }
    
    func applyBlurWithRadius(_ blurRadius: Float, tintColor: UIColor, saturationDeltaFactor: Float, maskImage: UIImage?) -> UIImage? {
        if self.size.width < 1 || self.size.height < 1 {
            return nil
        }
        if self.cgImage == nil {
            return nil
        }
        if maskImage != nil && maskImage?.cgImage == nil {
            return nil
        }
        
        let imageRect = CGRect(origin: CGPoint.zero, size: self.size)
        var effectImage = self
        
        let hasBlur = blurRadius > Float.ulpOfOne
        let hasSaturationChange = fabs(saturationDeltaFactor - 1.0) > Float.ulpOfOne
        if hasBlur || hasSaturationChange {
            UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
//            let context = UIGraphicsGetCurrentContext()
            
            guard let context = UIGraphicsGetCurrentContext() else {
                return nil
            }
            
            context.scaleBy(x: 1.0, y: -1.0)
            context.translateBy(x: 0, y: -self.size.height)
            context.draw(self.cgImage!, in: imageRect)
            
            var effectInBuffer: vImage_Buffer = vImage_Buffer()
            effectInBuffer.data = context.data
            effectInBuffer.width = UInt(context.width)
            effectInBuffer.height = UInt(context.height)
            effectInBuffer.rowBytes = context.bytesPerRow
            
            UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
            guard let effectOutContext = UIGraphicsGetCurrentContext() else {
                return nil
            }
            
            var effectOutBuffer: vImage_Buffer = vImage_Buffer()
            effectOutBuffer.data = effectOutContext.data
            effectOutBuffer.width = UInt(effectOutContext.width)
            effectOutBuffer.height = UInt(effectOutContext.height)
            effectOutBuffer.rowBytes = effectOutContext.bytesPerRow
            
            if hasBlur {
                let inputRadius = blurRadius * Float(UIScreen.main.scale)
                let radius = floor(inputRadius * 3.0 * sqrt(2.0 * M_PI) / 4.0 + 0.5)
                if radius % 2 != 1 {
                    radius += 1
                }
                
                vImageBoxConvolve_ARGB8888(effectInBuffer, effectOutBuffer, nil, 0, 0, radius, radius, 0, kvImageEdgeExtend)
                vImageBoxConvolve_ARGB8888(effectOutBuffer, effectInBuffer, nil, 0, 0, radius, radius, 0, kvImageEdgeExtend)
                vImageBoxConvolve_ARGB8888(effectInBuffer, effectOutBuffer, nil, 0, 0, radius, radius, 0, kvImageEdgeExtend)
            }
        }
    }
}
