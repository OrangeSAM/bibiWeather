//
//  WeatherForcastView.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/20.
//

import SwiftUI

struct WeatherForecastView: View {
    let forecasts: [WeatherData]
    let theme: WeatherTheme
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(forecasts) { forecast in
                    FutureWeatherView(
                        weatherData: forecast,
                        theme: theme
                    )
                }
            }
            .padding(.horizontal)
        }
    }
}
