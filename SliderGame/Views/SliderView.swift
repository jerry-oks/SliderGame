//
//  SliderView.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 25.10.2023.
//

import SwiftUI

struct SliderView: View {
    @EnvironmentObject var gameManager: GameManager
    
    var body: some View {
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
    }
}

#Preview {
    SliderView()
        .environmentObject(GameManager())
}
