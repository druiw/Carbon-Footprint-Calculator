//
//  CategoryView.swift
//  Carbon Footprint Calculator
//
//  Created by Drew Igoe on 12/4/24.
//
import SwiftUI

struct CategoryView: View {
    var body: some View {
        VStack {
            NavigationLink(destination: HomeEnergyView()) {
                CategoryRectangle(text: "Home Energy")
            }
            NavigationLink(destination: TransportationView()) {
                CategoryRectangle(text: "Transportation")
            }
        }
    }
}

#Preview {
    CategoryView()
}
