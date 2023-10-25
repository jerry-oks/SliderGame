//
//  CheatModeLabelView.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 24.10.2023.
//

import SwiftUI

struct CheatModeLabelView: View {
    @Binding var currentValue: Float
    @Binding var targetValue: Int
    @Binding var counter: Int
    
    var body: some View {
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
        .opacity(counter == 10 ? 0.5 : 0)
        .animation(.default, value: counter)
    }
}
