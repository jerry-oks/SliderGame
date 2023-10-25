//
//  CheatModeLabelView.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 24.10.2023.
//

import SwiftUI

struct CheatModeLabelView: View {
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
        VStack {
            Text("Чит-моуд активэйтед 😎")
                .padding(.bottom)
            
            TextValueView(
                description: "Загаданное число:",
                value: gameManager.game.targetValue.formatted()
            )

            TextValueView(
                description: "Выбранное число:",
                value: lroundf(gameManager.game.currentValue).formatted(),
                colorChangeCondition: lroundf(gameManager.game.currentValue) == gameManager.game.targetValue
            )
            
            TextValueView(
                description: "Количество баллов:",
                value: gameManager.computeScore().formatted(),
                colorChangeCondition: gameManager.computeScore() == 100
            )
        }
        .padding()
        .background(.quaternary, in: .rect(cornerRadius: 16))
        .opacity(gameManager.cheatModeCounter == 10 ? 0.5 : 0)
        .animation(.default, value: gameManager.cheatModeCounter)
    }
}

struct TextValueView: View {
    let description: String
    let value: String
    var colorChangeCondition: Bool = true
    
    var body: some View {
        HStack {
            Text(description)
            Text(value)
                .foregroundStyle(colorChangeCondition ? .green : .red)
                .frame(width: 40)
        }
    }
}
