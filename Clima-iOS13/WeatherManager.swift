//
//  WeatherManager.swift
//  Clima
//
//  Created by Jason Rosenthal on 2/25/22.
//  Copyright © 2022 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=5905dfd94a8388cff9fb9aef6624c3e7&units=imperial"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String){
        
        if let url = URL(string: urlString){
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url){(data,response,error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    
                    self.parseJSON(weatherData: safeData)
                }
                
            }
            
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data){
        let decorder = JSONDecoder()
        do{
        let decodedData = try decorder.decode(WeatherData.self, from: weatherData)
            print(decodedData.main.temp)
            print(decodedData.weather[0].description)
    } catch {
        print(error)
    }
}
    
    
}
