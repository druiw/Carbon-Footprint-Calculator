import SwiftUI

struct TransportationView: View {
    @State private var milesDriven: String = ""
    @State private var fuelEfficiency: String = ""
    @State private var publicTransitRides: String = ""
    @State private var carbonFootprint: Double? = nil

    var body: some View {
        ScrollView {  // Add ScrollView to handle overflow
            VStack {
                Text("Transportation")
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .padding()

                // Input fields for transportation
                VStack {
                    Text("Enter your monthly transportation usage:")
                        .font(.title2)
                        .padding(.bottom, 5)
                        .multilineTextAlignment(.center)
                        .lineLimit(nil)
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal)

                    Text("(whole numbers only):")
                        .font(.body)
                        .padding(.bottom, 5)

                    TextField("Miles driven per month (miles)", text: $milesDriven)
                        .keyboardType(.numberPad) // Use numberPad for whole number input
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))

                    TextField("Fuel efficiency of your vehicle (mpg)", text: $fuelEfficiency)
                        .keyboardType(.decimalPad) // Decimal input for fuel efficiency
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))

                    TextField("Public transit rides per month", text: $publicTransitRides)
                        .keyboardType(.numberPad) // Use numberPad for whole number input
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray))
                }
                .padding()

                // Button to calculate carbon footprint
                Button(action: calculateTransportationFootprint) {
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
                    Text("Your estimated transportation carbon footprint: \(carbonFootprint, specifier: "%.2f") kg CO₂")
                        .font(.title2)
                        .padding()
                }

                // Energy-saving tips section
                VStack(alignment: .leading, spacing: 10) {
                    Text("Energy Saving Tips")
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text("1. Drive less")
                    Text("2. Use public transportation")
                    Text("3. Maintain your vehicle")
                    Text("4. Consider an electric vehicle")
                }
                .padding()
                .foregroundColor(.green)

                Spacer()
            }
            .padding()
        }
    }
    
    // Function to calculate transportation carbon footprint based on user input
    func calculateTransportationFootprint() {
        let miles = Double(milesDriven) ?? 0
        let efficiency = Double(fuelEfficiency) ?? 0
        let publicTransit = Double(publicTransitRides) ?? 0
        
        // Example calculations (you can adjust these formulas)
        // Assume 0.9 kg CO2 per mile for average car fuel emissions (adjust based on car type)
        let carCO2 = miles / efficiency * 0.9
        
        // Assume 0.15 kg CO2 per public transit ride (adjust for region)
        let transitCO2 = publicTransit * 0.15
        
        // Combine the emissions
        carbonFootprint = carCO2 + transitCO2
    }
}

#Preview {
    TransportationView()
}
