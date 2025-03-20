//
//  Models.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/20.
//

import Foundation
import SwiftUI

// 天气类型枚举
enum Weather: String {
    case sunny = "sun.max.fill"
    case cloudySun = "cloud.sun.fill"
    case cloudy = "cloud.fill"
    case rainy = "cloud.rain.fill"
    
    var description: String {
        switch self {
        case .sunny: return "晴天"
        case .cloudySun: return "多云转晴"
        case .cloudy: return "多云"
        case .rainy: return "雨天"
        }
    }
}

// 天气数据模型
struct WeatherData: Identifiable {
    let id = UUID()
    let day: String
    let weather: Weather
    let temperature: Int
}

// 主题设置
struct WeatherTheme {
    let backgroundGradient: [Color]
    let textColor: Color
    let secondaryColor: Color
    
    static let light = WeatherTheme(
        backgroundGradient: [.blue, .white],
        textColor: .white,
        secondaryColor: .white.opacity(0.7)
    )
    
    static let dark = WeatherTheme(
        backgroundGradient: [.black, .gray],
        textColor: .white,
        secondaryColor: .gray
    )
}
