//
//  WeatherButton.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/20.
//

import SwiftUI

struct WeatherButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Text(title)
                .bold()
                .font(.title2)
                .frame(width: 280, height: 50)
                .background(.white)
                .foregroundColor(.blue)
                .cornerRadius(8)
        }
    }
}
