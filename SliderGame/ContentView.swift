//
//  ContentView.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 23.10.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var currentValue = Float.random(in: 0...100)
    @State private var targetValue = Int.random(in: 0...100)
    @State private var cheatModeCounter = 0
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            VStack {
                Text("Чит-моуд активэйтед 😎")
                Text(lroundf(currentValue).formatted())
                    .foregroundStyle(
                        lroundf(currentValue) == targetValue
                        ? .green
                        : .red
                    )
            }
            .padding()
            .background(.quaternary, in: .rect(cornerRadius: 16))
            .opacity(cheatModeCounter == 10 ? 0.5 : 0)
            .animation(.default, value: cheatModeCounter)
            
            Spacer()
            
            Text("Подвиньте слайдер как можно ближе к \(targetValue)")
                .onTapGesture {
                    cheatModeCounter = cheatModeCounter < 10
                    ? cheatModeCounter + 1
                    : 0
                }
                .padding(.bottom)
            
            HStack {
                Text("0")
                UISliderRepresentation(
                    value: $currentValue,
                    score: computeScore()
                )
                Text("100")
            }
            
            Button("Проверь меня!") {
                isPresented.toggle()
            }
            .alert(
                "Вы заработали \(computeScore()) \(pointsLocalizedString())",
                isPresented: $isPresented,
                actions: {}
            ) {
                Text("Выбранное число: \(lroundf(currentValue))")
            }
            .padding()
            
            Button("Начать заново", action: startOver)
            
            Spacer()
        }
        .padding()
    }
}

#Preview {
    ContentView()
}

private extension ContentView {
    func computeScore() -> Int {
        let difference = abs(targetValue - lroundf(currentValue))
        return 100 - difference
    }
    
    func startOver() {
        currentValue = Float.random(in: 0...100)
        targetValue = Int.random(in: 0...100)
        cheatModeCounter = 0
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
        
        return string
    }
}
