//
//  WeatherIcon.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/20.
//

import SwiftUI

struct WeatherIcon: View {
    let iconName: String
    let size: CGFloat
    
    init(iconName: String, size: CGFloat = 160) {
        self.iconName = iconName
        self.size = size
    }
    
    var body: some View {
        Image(systemName: iconName)
            .renderingMode(.original)
            .resizable()
            .scaledToFit()
            .frame(width: size, height: size)
    }
}
