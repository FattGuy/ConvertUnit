//
//  ContentView.swift
//  ConvertUnit
//
//  Created by Feng Chang on 5/8/20.
//  Copyright © 2020 Feng Chang. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var inputNumber = 0
    @State private var inputUnit = 1
    @State private var outUnit = 1
    @State private var result = ""
    
    //milliliters, liters, cups, pints, or gallons
    let unitOptions = ["milliliters", "liters", "cups", "pints", "gallons"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("From")) {
                    Picker("Volume conversion", selection: $inputUnit) {
                        ForEach(0..<unitOptions.count) {
                            Text(self.unitOptions[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("To")) {
                    Picker("Volume conversion", selection: $outUnit) {
                        ForEach(0..<unitOptions.count) {
                            Text(self.unitOptions[$0])
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Result")) {
                    TextField("Test", text: $result)
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
