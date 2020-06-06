//
//  DJWAnimation.swift
//  
//
//  Created by dejaWorks on 08/02/2020.
//

import UIKit
import DJWBuilderNS


public extension Builder{
    class Animation{
        
        var animationDelay:TimeInterval = 0.0
        var animationDuration:TimeInterval = 0.4
        var onComplete:ClosureWith<Bool>?
        var animationBlock:ClosureBasic = {}
        var springDamping:CGFloat = 1.0
        var springVelocity:CGFloat = 3.0
        
        public init(_ block: @escaping ClosureBasic) {
            animationBlock = block
        }
        
        public func duration(_ ms: TimeInterval)->Self{
            animationDuration = ms
            return self
        }
        
        public func delay(_ ms: TimeInterval)->Self{
            animationDelay = ms
            return self
        }
        
        
        public func on(complete: @escaping ClosureWith<Bool>)->Self{
            onComplete = complete
            return self
        }
        
        /// Use this for setting on comlete event and running the animation immediately
        public func run(_ onComplete: @escaping ClosureWith<Bool>){
            self.onComplete = onComplete
            build()
        }
        public func build(){
            DispatchQueue.main.async{
                
                UIView.animate(
                    withDuration: self.animationDuration,
                    delay: self.animationDelay,
                    usingSpringWithDamping: self.springDamping,
                    initialSpringVelocity: self.springVelocity,
                    options: [.curveEaseInOut],
                    animations: self.animationBlock,
                    completion: self.onComplete
                )
                
            }
        }
    }
}
