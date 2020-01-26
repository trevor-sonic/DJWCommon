//
//  ButtonWithGestures.swift
//  ZoomNavigation
//
//  Created by dejaWorks on 12/06/2017.
//  Copyright © 2017 dejaWorks. All rights reserved.
//
import Foundation
import UIKit

@objc public protocol  DJWButtonWithGesturesDelegate:class {
    @objc optional func relativePoint(_ distance:CGPoint, sender:UIButton)
    @objc optional func slidePoint(_ distance:CGPoint, sender:UIButton)
    @objc optional func startPoint(_ point:CGPoint, sender:UIButton)
    @objc optional func endPoint  (_ point:CGPoint, sender:UIButton)
    @objc optional func slideUp(_ sender:UIButton)
    @objc optional func slideDown(_ sender:UIButton)
    @objc optional func slideLeft(_ sender:UIButton)
    @objc optional func slideRight(_ sender:UIButton)
    @objc optional func longPressed(_ sender:UIButton)
    @objc optional func tapRelease(_ sender:UIButton)
    
}

open class DJWButtonWithGestures: UIButton {
    
    open weak var delegate:DJWButtonWithGesturesDelegate?
    open var toggleMode  = false
    
    private var firstTouchLocation:CGPoint!
    private var isSlided    = false
    private var isTouchStarted = false
    private var longPressRecognizer:UILongPressGestureRecognizer?
    

    deinit {
        //print("deinit DJWButtonWithGestures.")
        if let longPressRecognizer = self.longPressRecognizer{
            self.removeGestureRecognizer(longPressRecognizer)
            //print("deinit removeGestureRecognizer(longPressRecognizer).")
        }
    }
    // MARK: - Long Press
    open func addLongPressListener(){
        if longPressRecognizer == nil {
            longPressRecognizer = UILongPressGestureRecognizer(target: self, action: #selector(longPressed))
            self.addGestureRecognizer(longPressRecognizer!)
        }
    }
    @objc internal func longPressed(_ sender: UIGestureRecognizer){
        if sender.state == .ended {
            //print("UIGestureRecognizerStateEnded")
        }
        else if sender.state == .began {
            //print("UIGestureRecognizerStateBegan.")
            print("Long Press")
            if let longPressFunc = delegate?.longPressed{
                longPressFunc(self)
            }
        }
    }
    
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        firstTouchLocation = getLocation(touches)
        isSlided = false
        isTouchStarted = true
        if let startPointFunc = delegate?.startPoint{
            startPointFunc(firstTouchLocation, self)
        }
    }
    override open func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)

        if isSlided, let endPointFunc = delegate?.endPoint{
            let location = getLocation(touches)
            endPointFunc(location, self)
        } else if !isSlided{
            if toggleMode {
                isSelected = !isSelected
            }
            if let tapReleaseFunc = delegate?.tapRelease, isTouchStarted {
                tapReleaseFunc(self)
                isTouchStarted = false
            }
        }
        
        
    }
    override open func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesMoved(touches, with: event)
        let location = getLocation(touches)
        
        if let relativePointFunc = delegate?.relativePoint{
            relativePointFunc(location, self)
        }
        
        if let slidePointFunc = delegate?.slidePoint{
            let distance = CGPoint(x: location.x - firstTouchLocation.x, y: location.y - firstTouchLocation.y)
            slidePointFunc(distance, self)
        }
        checkSlideDirections(location)
        
    }
    func checkSlideDirections(_ location: CGPoint){
        // 0.5 is half of visual size
        let distanceRatio:CGFloat = 0.5
        
        let vDistance = frame.size.height * distanceRatio
        let hDistance = frame.size.width * distanceRatio
        
        if let slideUpFunc = delegate?.slideUp {
            if location.y < firstTouchLocation.y - vDistance && !isSlided {
                print("Slide Up")
                isSlided = true
                slideUpFunc(self)
                return
            }
        }
        if let slideDownFunc = delegate?.slideDown {
            if location.y > firstTouchLocation.y + vDistance && !isSlided {
                print("Slide Down")
                isSlided = true
                slideDownFunc(self)
                return
            }
        }
        if let slideLeftFunc = delegate?.slideLeft {
            if location.x < firstTouchLocation.x - hDistance && !isSlided {
                print("Slide Left")
                isSlided = true
                slideLeftFunc(self)
                return
            }
        }
        if let slideRightFunc = delegate?.slideRight {
            if location.x > firstTouchLocation.x + hDistance && !isSlided {
                print("Slide Right")
                isSlided = true
                slideRightFunc(self)
                return
            }
        }
        
    }
    public func getLocation(_ touches: Set<UITouch>)->CGPoint{
        let touch = touches.first!
        let touchLocation = touch.location(in: self)
        return touchLocation
    }
}
