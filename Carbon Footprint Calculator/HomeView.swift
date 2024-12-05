//
//  HomeView.swift
//  Carbon Footprint Calculator
//
//  Created by Drew Igoe on 12/4/24.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            VStack {
                Text("Carbon Footprint Calculator")
                    .font(.title)
                    .fontWeight(.light)
                    .padding(.top, 35)
                
                Spacer()
                
                NavigationLink(destination: CategoryView()) {
                    HStack {
                        Text("Begin")
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .cornerRadius(10)
                            .frame(width: 200, height: 50)
                    }
                }
                Spacer()
                Text("Made by Drew Igoe")
                    .fontWeight(.light)
            }
        }
    }
}

#Preview {
    HomeView()
}
