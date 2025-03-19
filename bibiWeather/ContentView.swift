//
//  ContentView.swift
//  bibiWeather
//
//  Created by 刘一笔 on 2025/3/18.
//

import SwiftUI

struct ContentView: View {
    @State var degree: Int = 37
    @State var isDark = false
    
    var body: some View {
        ZStack{
            LinearGradient(colors:isDark ?  [Color.black, Color.gray] : [ Color.blue, Color.white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack {
                Text("深圳").font(.system(size: 60))
                    .foregroundStyle(.white)
                    .onTapGesture {
                        isDark.toggle()
                    }
                
                Image(systemName: "cloud.sun.fill")
                    .renderingMode(.original)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 160,height: 160)
                
                Text("\(degree)°")
                    .font(.system(size: 40))
                    .foregroundStyle(.white)
                    .onTapGesture {
                        degree -= 1
                    }
                
                
                Spacer()
                
                HStack(spacing: 15){
                    FutureWeather(day:"周一",   weather: "cloud.sun.fill", degree:  27)
                    
                    FutureWeather(day:"周一",   weather: "cloud.sun.fill", degree:  27)
                
                    FutureWeather(day:"周一",   weather: "cloud.sun.fill", degree:  27)
                
                    FutureWeather(day:"周一",   weather: "cloud.sun.fill", degree:  27)
                
                    FutureWeather(day:"周一",   weather: "cloud.sun.fill", degree:  27)
                
                    FutureWeather(day:"周一",   weather: "cloud.sun.fill", degree:  27)
                }
                
                Spacer()
                
                Button{
                    degree += 1
                } label: {
                    Text("降温")
                        .bold()
                        .font(.title2)
                        .frame(width: 280, height: 50)
                        .background(.white)
                        .cornerRadius(8)
                }
            }
        }
    }
}


struct FutureWeather:View {
    var day: String
    var weather : String
    var degree : Int
    var body: some View {
        VStack{
            Text(day)
            Image(systemName: weather)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .frame(width: 52, height: 52)
            
            Text("\(degree)°")
                .font(.system(size: 40))
                .foregroundStyle(.white)
            
        }
    }
}

#Preview {
    ContentView()
}
