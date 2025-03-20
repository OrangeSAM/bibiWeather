//
//  WeatherViewModel.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/20.
//

import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var currentCity = "深圳"
    @Published var isDark = false
    @Published var temperature = 37
    @Published var currentWeather: Weather = .cloudySun
    
    @Published var forecasts: [WeatherData] = []
    
    init() {
        // 初始化未来天气预报数据
        generateForecasts()
    }
    
    private func generateForecasts() {
        let days = ["周一", "周二", "周三", "周四", "周五", "周六"]
        let weathers: [Weather] = [.sunny, .cloudySun, .cloudy, .rainy]
        
        forecasts = days.map { day in
            WeatherData(
                day: day,
                weather: weathers.randomElement() ?? .sunny,
                temperature: Int.random(in: 20...35)
            )
        }
    }
    
    func increaseTemperature() {
        temperature += 1
    }
    
    func decreaseTemperature() {
        temperature -= 1
    }
    
    func toggleTheme() {
        isDark.toggle()
    }
    
    var currentTheme: WeatherTheme {
        isDark ? .dark : .light
    }
}
