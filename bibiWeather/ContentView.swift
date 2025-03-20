////
////  ContentView.swift
////  bibiWeather
////
////  Created by 刘一笔 on 2025/3/18.
////
//
//import SwiftUI
//
//struct ContentView: View {
//    @State var degree: Int = 37
//    @State var isDark = false
//
//    var body: some View {
//        ZStack {
//            LinearGradient(
//                colors: isDark
//                    ? [Color.black, Color.gray] : [Color.blue, Color.white],
//                startPoint: .topLeading, endPoint: .bottomTrailing
//            )
//            .ignoresSafeArea()
//
//            
//            VStack {
//                Text("深圳").font(.system(size: 60))
//                    .foregroundStyle(.white)
//                    .onTapGesture {
//                        isDark.toggle()
//                    }
//
//                Image(systemName: "cloud.sun.fill")
//                    .renderingMode(.original)
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 160, height: 160)
//
//                Text("\(degree)°")
//                    .font(.system(size: 40))
//                    .foregroundStyle(.white)
//                    .onTapGesture {
//                        degree -= 1
//                    }
//
//                Spacer()
//
//                HStack(spacing: 10) {
//                    FutureWeather(
//                        day: "周一", weather: "cloud.sun.fill", degree: 27)
//
//                    FutureWeather(
//                        day: "周一", weather: "cloud.sun.fill", degree: 27)
//
//                    FutureWeather(
//                        day: "周一", weather: "cloud.sun.fill", degree: 27)
//
//                    FutureWeather(
//                        day: "周一", weather: "cloud.sun.fill", degree: 27)
//
//                    FutureWeather(
//                        day: "周一", weather: "cloud.sun.fill", degree: 27)
//                }
//
//                Spacer()
//
//                Button {
//                    degree += 1
//                } label: {
//                    Text("降温")
//                        .bold()
//                        .font(.title2)
//                        .frame(width: 280, height: 50)
//                        .background(.white)
//                        .cornerRadius(8)
//                }
//            }
//        }
//    }
//}
//
//struct FutureWeather: View {
//    var day: String
//    var weather: String
//    var degree: Int
//    var body: some View {
//        VStack {
//            Text(day)
//                .foregroundStyle(.white)
//            Image(systemName: weather)
//                .renderingMode(.original)
//                .resizable()
//                .scaledToFit()
//                .frame(width: 52, height: 52)
//
//            Text("\(degree)°")
//                .font(.system(size: 40))
//                .foregroundStyle(.white)
//
//        }
//    }
//}
//
//#Preview {
//    ContentView()
//}

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = WeatherViewModel()
    
    var body: some View {
        ZStack {
            // 背景
            BackgroundView(theme: viewModel.currentTheme)
            
            // 主要内容
            VStack(spacing: 20) {
                // 城市名称
                Text(viewModel.currentCity)
                    .font(.system(size: 60))
                    .foregroundColor(viewModel.currentTheme.textColor)
                    .onTapGesture {
                        viewModel.toggleTheme()
                    }
                
                // 当前天气图标
                WeatherIcon(iconName: viewModel.currentWeather.rawValue)
                
                // 当前温度
                Text("\(viewModel.temperature)°")
                    .font(.system(size: 40))
                    .foregroundColor(viewModel.currentTheme.textColor)
                    .onTapGesture {
                        viewModel.decreaseTemperature()
                    }
                
                Spacer()
                
                // 未来天气预报
                WeatherForecastView(
                    forecasts: viewModel.forecasts,
                    theme: viewModel.currentTheme
                )
                
                Spacer()
                
                // 控制按钮
                VStack(spacing: 10) {
                    WeatherButton(title: "升温") {
                        viewModel.increaseTemperature()
                    }
                    
                    WeatherButton(title: "降温") {
                        viewModel.decreaseTemperature()
                    }
                }
            }
            .padding()
        }
    }
}

// 预览支持
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("Light Mode")
            
            ContentView()
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
