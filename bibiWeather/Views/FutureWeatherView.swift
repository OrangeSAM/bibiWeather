//
//  FutureWeatherView.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/20.
//

import SwiftUI

struct FutureWeatherView: View {
    let weatherData: WeatherData
    let theme: WeatherTheme
    
    var body: some View {
        VStack {
            Text(weatherData.day)
                .foregroundColor(theme.textColor)
            
            WeatherIcon(iconName: weatherData.weather.rawValue, size: 52)
            
            Text("\(weatherData.temperature)°")
                .font(.system(size: 20))
                .foregroundColor(theme.textColor)
        }
    }
}
