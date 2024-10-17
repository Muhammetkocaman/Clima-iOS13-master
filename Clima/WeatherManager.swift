

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
            let task = session.dataTask(with: url,completionHandler: handle(data:response:error:) )
            //4. Start the task
            task.resume()
        }
        
        
        
    }
    func handle(data : Data?,response : URLResponse?, error : Error?) {
        if error != nil {
            print(error ?? "Unknown error")
            return
        }
        if let safeData = data {
            let dataString = String(data: safeData, encoding: .utf8)
            print(dataString)
        }
    }
    
    
}
