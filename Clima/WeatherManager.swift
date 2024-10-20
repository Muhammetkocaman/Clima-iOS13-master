

import Foundation

struct WeatherManager {

    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?appid=7b313b5d9e8ec632b31dd871a50513d3&units=metric"
    func fetchWeather(cityName: String)  {
        let urlString = "\(weatherURL)&q=\(cityName)"
        performRequest(urlString: urlString)
    }
    func performRequest(urlString : String)  {
        //1. Create Url
        if let url = URL(string: urlString) {
            //2. Create URLsession
            let session = URLSession(configuration: .default)
            //3. Give a session task
            // added closure
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error ?? "Unknown error")
                    return
                }
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            //4. Start the task
            task.resume()
        }
        
        
        
    }
    func parseJSON (weatherData : Data) {
         let decoder = JSONDecoder()
        do {
            let decodedData = try  decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.weather[0].icon)
            let id = decodedData.weather[0].id
            let temp = decodedData.main.temp
            let cityName = decodedData.name
            let weather = WeatherModel(contidionID: id, cityName: cityName, temperature: temp)
            
            let getWeather = WeatherModel.getConditionName( weather)
            print(getWeather)
        } catch{}
        }
  
        
        
    }
            
    
    

