//
//  RoundBorderedView.swift
//  MidiSeq
//
//  Created by dejaWorks on 03/06/2017.
//  Copyright © 2017 dejaWorks. All rights reserved.
//
import Foundation
import UIKit
@IBDesignable

open class DJWRoundCornerBorderedView: UIView
{
    @IBInspectable public var borderWidth: CGFloat = 2 {
        didSet {
            invalidateIntrinsicContentSize()
        }
    }
    @IBInspectable public var borderOffset: CGFloat = 0
    @IBInspectable public var cornerRadius: CGFloat = 5{
        didSet { 
            invalidateIntrinsicContentSize()
        }
    }
    @IBInspectable public var rectBgColor:     UIColor = UIColor.darkGray
    @IBInspectable public var rectBorderColor: UIColor = UIColor.lightGray
    
    
    override open func draw(_ rect: CGRect)
    {
        super.draw(rect)
        backgroundColor = UIColor.clear
        isOpaque = false
        roundRect()
    }
    
    internal func roundRect()
    {
        let xStart:CGFloat = (borderWidth * 0.5) + borderOffset
        let yStart:CGFloat = xStart
        
        let borderDistanceFromBottomCorner:CGFloat = xStart * 2
        let rectWidth:CGFloat = self.frame.width - borderDistanceFromBottomCorner
        let rectHeight:CGFloat = self.frame.height - borderDistanceFromBottomCorner
        
        let ctx: CGContext = UIGraphicsGetCurrentContext()!
        ctx.saveGState()
        
        ctx.setLineWidth(borderWidth)
        ctx.setStrokeColor(rectBorderColor.cgColor)
        
        
        
        let rect = CGRect(x: xStart, y: yStart, width: rectWidth, height: rectHeight)
        let clipPath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        let linePath: CGPath = UIBezierPath(roundedRect: rect, cornerRadius: cornerRadius).cgPath
        
        
        ctx.addPath(clipPath)
        ctx.setFillColor(rectBgColor.cgColor)
        ctx.closePath()
        ctx.fillPath()
        
        ctx.addPath(linePath)
        ctx.strokePath()
        
        ctx.restoreGState()
        
    }
    
}
