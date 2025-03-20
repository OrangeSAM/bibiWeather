//
//  BackgroundView.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/20.
//

import SwiftUI

struct BackgroundView: View {
    let theme: WeatherTheme
    
    var body: some View {
        LinearGradient(
            colors: theme.backgroundGradient,
            startPoint: .topLeading,
            endPoint: .bottomTrailing
        )
        .ignoresSafeArea()
    }
}
