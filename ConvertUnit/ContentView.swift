//
//  ContentView.swift
//  ConvertUnit
//
//  Created by Feng Chang on 5/8/20.
//  Copyright © 2020 Feng Chang. All rights reserved.
//

import SwiftUI

enum VolumeUnit {
    case ml
    case l
    case cups
    case pints
    case gallons
}

struct ContentView: View {
    @State private var inputNumber = ""
    @State private var inputUnit = 1
    @State private var outUnit = 1
    
    //milliliters, liters, cups, pints, or gallons
    let unitStringOptions = ["milliliters", "liters", "cups", "pints", "gallons"]
    let unitOptions = [UnitVolume.milliliters, UnitVolume.liters, UnitVolume.cups, UnitVolume.pints, UnitVolume.gallons]
    
    private var result: String {
        guard let inputNumber = Double(self.inputNumber) else { return "" }
        let converFromUnit = unitOptions[inputUnit]
        let converToUnit = unitOptions[outUnit]
        let converFromUnitBase = Measurement(value: inputNumber, unit: converFromUnit)
        let converToUnitBase = converFromUnitBase.converted(to: converToUnit)
        
        return "\(converToUnitBase)"
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From")) {
                    Picker("Volume conversion", selection: $inputUnit) {
                        ForEach(0..<unitStringOptions.count) {
                            Text(self.unitStringOptions[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")) {
                    Picker("Volume conversion", selection: $outUnit) {
                        ForEach(0..<unitStringOptions.count) {
                            Text(self.unitStringOptions[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Input")) {
                    TextField("How much?", text: $inputNumber)
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Result")) {
                    Text("\(self.result)")
                }
            }
            .navigationBarTitle("Unit Conversion")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
