//
//  Animation.swift
//  Swiftbook_HW 9
//
//  Created by Arcani on 22.09.2021.
//

import Foundation

class Animation {
    
    let force: Double
    let animation: String
    let curve: String
    let duration: Double
    
    init(force: Double, animation: String, curve: String, duration: Double) {
        self.force = force
        self.animation = animation
        self.curve = curve
        self.duration = duration
    }
    
    static func getAnimation() -> Animation {
        
        let randomForce = Double.random(in: 0.1 ... 1)
        let randomAnimation = StyleAndCurveOfAnimation.shared.animationTypes.first ?? ""
        let randomCurve = StyleAndCurveOfAnimation.shared.curves.first ?? ""
        let randomDuration = Double.random(in: 0.8 ... 1.5)
        
        let generatedAnimation = Animation(
            force: randomForce,
            animation: randomAnimation,
            curve: randomCurve,
            duration: randomDuration)
        
        StyleAndCurveOfAnimation.shared.animationTypes.shuffle()
        StyleAndCurveOfAnimation.shared.curves.shuffle()
        
        return generatedAnimation
    }
}
