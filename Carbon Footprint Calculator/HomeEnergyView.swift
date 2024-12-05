//
//  HomeEnergyView.swift
//  Carbon Footprint Calculator
//
//  Created by Drew Igoe on 12/4/24.
//

import SwiftUI
import UIKit

struct HomeEnergyView: View {
    @State private var electricityUsage: String = ""
    @State private var gasUsage: String = ""
    @State private var waterUsage: String = ""
    @State private var carbonFootprint: Double? = nil

    var body: some View {
        VStack {
            Text("Home Energy Usage ")
                .font(.largeTitle)
                .fontWeight(.semibold)
                .padding()

            // Input fields for energy usage
            VStack {
                Text("Enter your monthly energy usage")
                    .font(.headline)
                    .padding(.bottom, 5)
                Text("(whole numbers only):")
                    .font(.body)
                    .padding(.bottom, 5)

                TextField("Electricity usage (kWh)", text: $electricityUsage)
                    .keyboardType(.numberPad) // Use numberPad for whole number input
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                
                TextField("Gas usage (Therms)", text: $gasUsage)
                    .keyboardType(.numberPad) // Use numberPad for whole number input
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                
                TextField("Water usage (Gallons)", text: $waterUsage)
                    .keyboardType(.numberPad) // Use numberPad for whole number input
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
            }
            .padding()

            // Button to calculate carbon footprint
            Button(action: calculateCarbonFootprint) {
                Text("Calculate Carbon Footprint")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding()

            // Display calculated carbon footprint
            if let carbonFootprint = carbonFootprint {
                Text("Your estimated carbon footprint: \(carbonFootprint, specifier: "%.2f") kg CO₂")
                    .font(.title2)
                    .padding()
            }

            // Energy-saving tips section
            VStack(alignment: .leading, spacing: 10) {
                Text("Energy Saving Tips")
                    .font(.title2)
                    .fontWeight(.semibold)

                Text("1. Turn off lights when not in use.")
                Text("2. Unplug electronics when they're not being used.")
                Text("3. Use energy-efficient appliances.")
                Text("4. Consider switching to renewable energy sources.")
            }
            .padding()
            .foregroundColor(.green)

            Spacer()
        }
        .padding()
    }
    
    // Function to calculate carbon footprint based on user input
    func calculateCarbonFootprint() {
        
        let electricityCO2 = Double(electricityUsage) ?? 0 * 0.92 // example: 0.92 kg CO2 per kWh
        let gasCO2 = Double(gasUsage) ?? 0 * 5.3  // example: 5.3 kg CO2 per therm of gas
        let waterCO2 = Double(waterUsage) ?? 0 * 0.3 // example: 0.3 kg CO2 per gallon of water used

        carbonFootprint = electricityCO2 + gasCO2 + waterCO2
    }
}

#Preview {
    HomeEnergyView()
}


