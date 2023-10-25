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
            
            HStack {
                Text("Загаданное число:")
                Text(gameManager.game.targetValue.formatted())
                    .foregroundStyle(.green)
                    .frame(width: 40)
            }
            
            HStack {
                Text("Выбранное число:")
                Text(lroundf(gameManager.game.currentValue).formatted())
                    .foregroundStyle(
                        lroundf(gameManager.game.currentValue) == gameManager.game.targetValue
                        ? .green
                        : .red
                    )
                    .frame(width: 40)
            }
            
            HStack {
                Text("Количество баллов:")
                Text(gameManager.computeScore().formatted())
                    .foregroundStyle(
                        gameManager.computeScore() == 100
                        ? .green
                        : .red
                    )
                    .frame(width: 40)
            }
        }
        .padding()
        .background(.quaternary, in: .rect(cornerRadius: 16))
        .opacity(gameManager.cheatModeCounter == 10 ? 0.5 : 0)
        .animation(.default, value: gameManager.cheatModeCounter)
    }
}
