
//
//  ContentView.swift
//  DunyaGezgini
//
//  Created by Hakan Gül on 15.02.2023.
//

import SwiftUI

struct ContentView: View {
    @State var fahrenheitValue: String = ""
    @State var isVisible = false
    let numberFormatter : NumberFormatter = {
      let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        numberFormatter.minimumFractionDigits = 0
        numberFormatter.maximumFractionDigits = 2
        return numberFormatter
    }()
    func convertToCelsius() -> String {
        if let value = Double(fahrenheitValue) {
            let fahValue = Measurement<UnitTemperature>(
                value: value, unit: .fahrenheit)
            let celciusValue = fahValue.converted(to: .celsius)
            let formattedCelciusValue = numberFormatter.string(from: NSNumber(value:celciusValue.value))
            return formattedCelciusValue ?? "???"
        } else {
            return "???"
        }
    }
    
    var body: some View {
        VStack {
            TextField("CONVERSION_TEXT_FIELD_PLACEHOLDER", text: $fahrenheitValue)
                .keyboardType(.decimalPad)
                .font(Font.system(size: 64.0))
                .multilineTextAlignment(.center)
            Text("CONVERSION_FAHRENHEIT")
            Text("CONVERSION_IS_ACTUALLY").foregroundColor(.gray)
            Text(convertToCelsius())
            Text("100").font(Font.system(size: 64.0))
            Text("CONVERSION_DEGREES_CELCIUS")
            Button(action: {
                print("Hello")
            }, label: {
                Text("CONVERSION_BUTTON")
            })
           
            Spacer()
        }
        .foregroundColor(.orange)
        .font(.title)
        .opacity(isVisible ? 1.0 : 0.0)
        .offset(x:0, y: isVisible ? 0 : 20)
        .animation(.easeIn(duration: 2.0), value: isVisible)
        .onAppear {
            // ekranda ilk gözüktüğü anı belirtiyor onApper
            self.isVisible = true
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
