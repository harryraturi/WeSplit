//
//  ContentView.swift
//  WeSplit
//
//  Created by Harish Rathuri on 31/07/21.
//

import SwiftUI


struct ContentView: View {
    @State private var checkAmount = ""
    @State private var numberOfPeople = "2"
    @State private var tipPercentage = 2
    
    let tipPercentages = [10, 15, 20, 25, 0]
    
    var totalAndPerPersonAmount: (grandTotal: Double, amtPerPerson: Double) {
        // Calculate the total per person here
        let peopleCount = Double(numberOfPeople) ?? 0 + 2
        let tipSelection = Double(tipPercentages[tipPercentage])
        let orderAmount = Double(checkAmount) ?? 0
        
        let tipValue = orderAmount / 100 * tipSelection
        let grandTotal = orderAmount + tipValue
        let amountPerPerson = grandTotal / peopleCount
        
        return (grandTotal, amountPerPerson)
    }
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Enter bill amount and no. of people")) {
                    TextField("Amount", text: $checkAmount)
                        .keyboardType(.decimalPad)
                    
                    /*
                    Picker("Number of people", selection: $numberOfPeople) {
                        ForEach(2 ..< 100) {
                            Text("\($0) people")
                        }
                    }
                    */
                    
                    TextField("Number of people", text: $numberOfPeople)
                        .keyboardType(.decimalPad)
                    
                }
                
                Section(header: Text("How much tip do you want to leave?")) {
                    Picker("Tip percentage", selection: $tipPercentage) {
                        ForEach(0 ..< tipPercentages.count) {
                            Text("\(self.tipPercentages[$0])%")
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                
                Section(header: Text("Amount per person")) {
                    Text("$\(totalAndPerPersonAmount.amtPerPerson, specifier: "%.2f")")
                }
                
                Section(header: Text("Total amount for check")) {
                    Text("$\(totalAndPerPersonAmount.grandTotal, specifier: "%.2f")")
                }
                
            }
            .navigationTitle("WeSplit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
