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
            GameModePickerView(gameMode: $gameManager.selectedGameMode)
                .onChange(of: gameManager.selectedGameMode) { newValue in
                    gameManager.setGameMode()
                }
            
            Spacer()
            
            CheatModeLabelView()
            
            Spacer()
            
            Text(gameManager.game.targetValueIsVisible
                 ? "Подвиньте слайдер как можно ближе к \(gameManager.game.targetValue.formatted())"
                 : "Выберите правильное положение слайдера"
            )
            .onTapGesture(perform: gameManager.cheatAction)
            .padding(.bottom)
            
            SliderView()
            
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
            
            Button("Начать заново", action: gameManager.setGameMode)
            
            Spacer()
            Spacer()
            Spacer()
        }
        .padding()
        .environmentObject(gameManager)
        .onAppear {
            gameManager.setGameMode()
        }
    }
}

#Preview {
    GameView()
}


