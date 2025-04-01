//
//  ContentView.swift
//  UnitConversions
//
//  Created by Anand Wetzel on 3/31/25.
//

import SwiftUI

struct ContentView: View {
    @FocusState private var amountIsFocused: Bool
    @State private var inputUnit = "meters"
    @State private var outputUnit = "yards"
    @State private var inputNumber = 0.0
    let units: [String] = ["meters", "yards", "feet", "inches"]
    
    var convertedNumber: Double{
        var convertToMeters: Double
        switch (inputUnit) {
        case "yards":
            convertToMeters = inputNumber * 0.9144
        case "feet":
            convertToMeters = inputNumber * 0.3048
        case "inches":
            convertToMeters = inputNumber * 0.0254
        default:
            convertToMeters = inputNumber
        }
        
        switch (outputUnit){
        case "yards":
            convertToMeters *= 1.0936
        case "feet":
            convertToMeters *= 3.2808
        case "inches":
            convertToMeters *= 39.3701
        default:
            break
        }
        
        return convertToMeters
    }
    
    var body: some View {
        VStack {
            NavigationStack{
                Form{
                    Section{
                        TextField("Input Number", value:$inputNumber, format:.number)
                            .keyboardType(.decimalPad)
                            .focused($amountIsFocused)
                        
                        Section("Select an Input Unit"){
                            Picker("Input Unit", selection: $inputUnit) {
                                ForEach(units, id: \.self) {
                                    Text($0)
                                }
                            }
                            .pickerStyle(.segmented)
                        }
                        
                        Section("Select an Output Unit"){
                            Picker("Input Unit", selection: $outputUnit) {
                                ForEach(units, id: \.self) {
                                    Text($0)
                                }
                            }.pickerStyle(.segmented)
                        }
                        
                        Section("Conversion Result"){
                            Text(convertedNumber, format: .number)
                        }
                    }
                    
                    
                }
                .navigationTitle("Unit Converter")
                .toolbar {
                    if amountIsFocused {
                        Button("Done") {
                            amountIsFocused = false
                        }
                    }
                }
                
            }
            
        }
        .padding()
        
    }
}

#Preview {
    ContentView()
}
