import Alamofire

public protocol WeatherService {
    func getTemperature() async throws -> Int
}

class WeatherServiceImpl: WeatherService {
    let url = "https://api.openweathermap.org/data/2.5/weather?q=corvallis&units=imperial&appid=a5f2b202f28278572eede550b67ede35"

    func getTemperature() async throws -> Int {
        return try await withCheckedThrowingContinuation { continuation in
            AF.request(url, method: .get).validate(statusCode: 200..<300).responseDecodable(of: Weather.self) { response in
                switch response.result {
                    case let .success(weather):
                        //print("----------003----------")
                        let temperature = weather.main.temp
                        let temperatureAsInteger = Int(temperature)
                        continuation.resume(with: .success(temperatureAsInteger))

                    case let .failure(error):
                        //print("----------004----------")
                        continuation.resume(with: .failure(error))
                }
            }
        }
    }
}

public struct Weather: Decodable {
    let main: Main

    struct Main: Decodable {
        let temp: Double
    }
}

extension Weather {
    init(_ input: Double) {
        let temp_t = input
        self.main = Weather.Main(temp: temp_t)
    }
}
