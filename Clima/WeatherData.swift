
//

import Foundation

struct WeatherData:Decodable {
    let name : String
    let main : Main
    let weather : [Weather]
    let wind : Wind
    
}
struct Main:Decodable {
    let temp : Double
    let sea_level : Int
}
struct Weather : Decodable {
    let description : String
    let id : Int
    let icon : String
}
struct Wind : Decodable{
    let speed : Double
}
