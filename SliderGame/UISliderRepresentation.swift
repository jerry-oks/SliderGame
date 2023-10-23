//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 23.10.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var value: Float
    var score: Int
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(context.coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.thumbTintColor = UIColor(
            red: 1,
            green: 0,
            blue: 0,
            alpha: Double(score) / 100
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(value: $value)
    }
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var value: Float

        init(value: Binding<Float>) {
            _value = value
        }

        @objc func valueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

#Preview {
    UISliderRepresentation(value: .constant(10), score: 50)
}
