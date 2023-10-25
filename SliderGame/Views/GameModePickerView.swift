//
//  GameModeSegmentedControlView.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 24.10.2023.
//

import SwiftUI

struct GameModePickerView: View {
    @Binding var gameMode: String
    
    let actionOnChange: () -> Void
    let gameModes = ["😀", "🙂", "😰", "🤯", "💀"]
    
    var body: some View {
        VStack {
            HStack {
                Text("Сложность игры:")
                    .bold()
                Spacer()
            }
            Picker("Сложность игры", selection: $gameMode) {
                ForEach(gameModes, id: \.self) {
                    Text($0)
                }
            }
            .pickerStyle(.segmented)
        }
    }
}

#Preview {
    GameModePickerView(gameMode: .constant("😀"), actionOnChange: {})
}
