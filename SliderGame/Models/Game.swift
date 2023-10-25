//
//  Game.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 24.10.2023.
//

import SwiftUI

enum GameMode: String {
    case light = "😀"
    case medium = "🙂"
    case hard = "😰"
    case xhard = "🤯"
    case impossible = "💀"
    
    var mode: Game {
        switch self {
        case .light:
            Game(
                mode: .light,
                min: 0,
                max: 100,
                targetValueIsVisible: true,
                intervalIsVisible: true,
                thumbIsTranslucent: true
            )
        case .medium:
            Game(
                mode: .medium,
                min: Int.random(in: 0...50),
                max: Int.random(in: 150...200),
                targetValueIsVisible: true,
                intervalIsVisible: true,
                thumbIsTranslucent: true
            )
        case .hard:
            Game(
                mode: .hard,
                min: Int.random(in: 0...100),
                max: Int.random(in: 200...300),
                targetValueIsVisible: false,
                intervalIsVisible: true,
                thumbIsTranslucent: true
            )
        case .xhard:
            Game(
                mode: .xhard,
                min: Int.random(in: 0...100),
                max: Int.random(in: 200...300),
                targetValueIsVisible: false,
                intervalIsVisible: false,
                thumbIsTranslucent: true
            )
        case .impossible:
            Game(
                mode: .impossible,
                min: Int.random(in: 0...100),
                max: Int.random(in: 200...300),
                targetValueIsVisible: false,
                intervalIsVisible: false,
                thumbIsTranslucent: false
            )
        }
    }
}

struct Game {
    let mode: GameMode
    var min: Int
    var max: Int
    let targetValueIsVisible: Bool
    let intervalIsVisible: Bool
    let thumbIsTranslucent: Bool
    var targetValue = 0
    var currentValue: Float = 0
}
