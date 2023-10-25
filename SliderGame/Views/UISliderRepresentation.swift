//
//  UISliderRepresentation.swift
//  SliderGame
//
//  Created by HOLY NADRUGANTIX on 23.10.2023.
//

import SwiftUI

struct UISliderRepresentation: UIViewRepresentable {
    @Binding var min: Int
    @Binding var max: Int
    @Binding var value: Float
    
    let opacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = Float(min)
        slider.maximumValue = Float(max)
        slider.addTarget(
            context.coordinator,
            action: #selector(context.coordinator.valueChanged),
            for: .valueChanged
        )
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = value
        uiView.minimumValue = Float(min)
        uiView.maximumValue = Float(max)
        uiView.thumbTintColor = UIColor.systemRed.withAlphaComponent(opacity)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(min: $min, max: $max, value: $value)
    }
}

extension UISliderRepresentation {
    class Coordinator: NSObject {
        @Binding var min: Int
        @Binding var max: Int
        @Binding var value: Float

        init(min: Binding<Int>, max: Binding<Int>, value: Binding<Float>) {
            _value = value
            _min = min
            _max = max
        }

        @objc func valueChanged(_ sender: UISlider) {
            value = sender.value
        }
    }
}

#Preview {
    UISliderRepresentation(min: .constant(0), max: .constant(100), value: .constant(10), opacity: 1)
}
