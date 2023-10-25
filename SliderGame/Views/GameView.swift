//
//  ContentView.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 23.10.2023.
//

import SwiftUI

struct GameView: View {
    @StateObject private var gameManager = GameManager()
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            CheatModeLabelView(
                currentValue: $gameManager.game.currentValue,
                targetValue: $gameManager.game.targetValue,
                counter: $gameManager.cheatModeCounter
            )
            
            Spacer()
            
            GameModePickerView(gameMode: $gameManager.selectedGameMode, actionOnChange: gameManager.setGameMode)
                .onChange(of: gameManager.selectedGameMode) { newValue in
                    gameManager.setGameMode()
                }
            
            Spacer()
            
            Text(gameManager.game.targetValueIsVisible
                 ? "Подвиньте слайдер как можно ближе к \(gameManager.game.targetValue.formatted())"
                 : "Выберите правильное положение слайдера"
            )
                .onTapGesture(perform: gameManager.cheatAction)
                .padding(.bottom)
            
            HStack {
                Text(gameManager.game.intervalIsVisible ? gameManager.game.min.formatted() : "???")
                UISliderRepresentation(
                    min: $gameManager.game.min,
                    max: $gameManager.game.max,
                    value: $gameManager.game.currentValue,
                    opacity: gameManager.game.thumbIsTranslucent ? gameManager.opacityFromScore() : 1
                )
                Text(gameManager.game.intervalIsVisible ? gameManager.game.max.formatted() : "???")
            }
            
            Button("Проверь меня!") {
                isPresented.toggle()
            }
            .alert(
                "Вы заработали \(gameManager.pointsLocalizedString())",
                isPresented: $isPresented,
                actions: {}
            ) {
                Text("""
                        Загаданное число: \(gameManager.game.targetValue),
                        интервал \(gameManager.game.min)...\(gameManager.game.max)
                        Выбранное число: \(lroundf(gameManager.game.currentValue))
                    """
                )
            }
            .padding()
            
            Button("Начать заново", action: gameManager.startOver)
            
            Spacer()
            
            Text(gameManager.computeScore().formatted())
            
            Spacer()
        }
        .padding()
        .onAppear {
            gameManager.setGameMode()
        }
    }
}

#Preview {
    GameView()
}


