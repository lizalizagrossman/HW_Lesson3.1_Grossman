//
//  AnimationType.swift
//  HW_Lesson3.1_Grossman
//
//  Created by Elizabeth on 18/03/2023.
//

import Foundation

struct Animation {
    let animation: String
    let curve: String
    let force: Float
    let delay: Float
    let duration: Float
    
    static func getRandomAnimationPattern() -> Animation {
        let animationData = DataStore.shared.animations.shuffled()
        let curveData = DataStore.shared.curves.shuffled()
        return Animation(
            animation: animationData.first ?? "",
            curve: curveData.first ?? "",
            force: round(Float.random(in: 1.0 ..< 5.0) * 10) / 10.0,
            delay: round(Float.random(in: 0.0 ..< 4.0) * 10) / 10.0,
            duration: round(Float.random(in: 0.8 ..< 4.0) * 10) / 10.0
        )
    }
}


