//
//  GameManager.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 24.10.2023.
//

import Foundation

final class GameManager: ObservableObject {
    @Published var selectedGameMode = "😀"
    @Published var cheatModeCounter = 0
    @Published var game = GameMode.light.mode

    func setGameMode() {
        switch selectedGameMode {
        case "🙂":
            game = GameMode.medium.mode
        case "😰":
            game = GameMode.hard.mode
        case "🤯":
            game = GameMode.xhard.mode
        case "💀":
            game = GameMode.impossible.mode
        default:
            game = GameMode.light.mode
        }
        
        game.currentValue = Float(Int.random(in: game.min...game.max))
        game.targetValue = Int.random(in: game.min...game.max)
    }
    
    func computeScore() -> Int {
        let multiplier = Double(game.max - game.min) / 100
        let targetValue = Double(game.targetValue - game.min) / multiplier
        let currentValue = (Double(game.currentValue) - Double(game.min)) / multiplier
        let difference = abs(lround(targetValue) - lround(currentValue))
        return 100 - difference
    }
    
    func pointsLocalizedString() -> String {
        let score = computeScore()
        
        if (5...20).contains(score) { return "баллов" }
        
        let digit = score.formatted().last
        var string = ""
        
        switch digit {
        case "1":
            string = "балл"
        case "2", "3", "4":
            string = "балла"
        default:
            string = "баллов"
        }
        
        return computeScore().formatted() + " " + string
    }
    
    func cheatAction() {
        cheatModeCounter = cheatModeCounter < 10
        ? cheatModeCounter + 1
        : 0
    }
    
    func startOver() {
        setGameMode()
        cheatModeCounter = 0
    }
    
    func opacityFromScore() -> Double {
        Double(computeScore()) / 100
    }
}
