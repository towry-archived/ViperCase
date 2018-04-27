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
    
    func applyBlurWithRadius(_ blurRadius: Float, tintColor: UIColor?, saturationDeltaFactor: Float, maskImage: UIImage?) -> UIImage? {
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
        var effectImage: UIImage? = self
        
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
                var radius = floor(Double(inputRadius) * 3.0 * sqrt(2.0 * Double.pi) / 4.0 + 0.5)
                
                if radius.truncatingRemainder(dividingBy: 2) != 1 {
//                if radius % 2 != 1 {
                    radius += 1
                }
                
                var zero = UInt8(0)
                
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, UInt32(radius), UInt32(radius), &zero, vImage_Flags(kvImageEdgeExtend))
                vImageBoxConvolve_ARGB8888(&effectOutBuffer, &effectInBuffer, nil, 0, 0, UInt32(radius), UInt32(radius), &zero, vImage_Flags(kvImageEdgeExtend))
                vImageBoxConvolve_ARGB8888(&effectInBuffer, &effectOutBuffer, nil, 0, 0, UInt32(Int(radius)), UInt32(radius), &zero, vImage_Flags(kvImageEdgeExtend))
            }
            
            var effectImageBuffersAreSwapped = false
            if hasSaturationChange {
                let s = CGFloat(saturationDeltaFactor)
                let floatingPointSaturationMatrix: [CGFloat] = [
                    0.0722 + 0.9278 * s,  0.0722 - 0.0722 * s,  0.0722 - 0.0722 * s,  0,
                    0.7152 - 0.7152 * s,  0.7152 + 0.2848 * s,  0.7152 - 0.7152 * s,  0,
                    0.2126 - 0.2126 * s,  0.2126 - 0.2126 * s,  0.2126 + 0.7873 * s,  0,
                    0,                    0,                    0,  1,
                ]
                
                let divisor: Int = 256
                let matrixSize = floatingPointSaturationMatrix.count
                var saturationMatrix: Array<Int16> = Array<Int16>(repeating: Int16(0), count: matrixSize)
                for index in 0..<matrixSize {
                    saturationMatrix[index] = Int16(roundf(Float(floatingPointSaturationMatrix[index] * CGFloat(divisor))))
                }
                if hasBlur {
                    vImageMatrixMultiply_ARGB8888(&effectOutBuffer, &effectInBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                    effectImageBuffersAreSwapped = true
                } else {
                    vImageMatrixMultiply_ARGB8888(&effectInBuffer, &effectOutBuffer, saturationMatrix, Int32(divisor), nil, nil, vImage_Flags(kvImageNoFlags))
                }
            }
            if !effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            }
            if effectImageBuffersAreSwapped {
                effectImage = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
            }
        } // end if
        
        // set up output context
        UIGraphicsBeginImageContextWithOptions(self.size, false, UIScreen.main.scale)
        guard let outputContext = UIGraphicsGetCurrentContext() else {
            return nil
        }
        outputContext.scaleBy(x: 1.0, y: -1.0)
        outputContext.translateBy(x: 0, y: -self.size.height)
        
        // draw base image
        outputContext.draw(self.cgImage!, in: imageRect, byTiling: false)
        
        // draw effect image
        if hasBlur {
            outputContext.saveGState()
            if maskImage != nil {
                outputContext.clip(to: imageRect, mask: maskImage!.cgImage!)
            }
            outputContext.draw(effectImage!.cgImage!, in: imageRect, byTiling: false)
            outputContext.saveGState()
        }
        
        // add in color tint
        if tintColor != nil {
            outputContext.saveGState()
            outputContext.setFillColor(tintColor!.cgColor)
            outputContext.fill(imageRect)
            outputContext.restoreGState()
        }
        
        let outputImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return outputImage
    }
}
