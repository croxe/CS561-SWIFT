
import XCTest
@testable import MyLibrary
//@testable import struct MyLibrary.Weather

final class WeatherServiceTests: XCTestCase {

    func testWeatherModelWithJson() throws {
        let rawData = """
        {
            "main": {
            "temp": 19.0
            },
        }
        """.data(using: .utf8)!
        
        let testingWeather: Weather = try JSONDecoder().decode(Weather.self, from: rawData)
        let number = 19.0

        // print(testingWeather.main.temp)
        // print(type(of: testingWeather))

        // Then
        XCTAssertNotNil(testingWeather)
        XCTAssert(testingWeather.main.temp == number )
    }

    func testWeatherModelWithParameters() throws {
        
        let number = 19.0
        
        let newWeather = Weather(main: Weather.Main(temp: 19.0))        
        
        let iniWeather = Weather(19.0)

        //print(newWeather.main.temp)
        //print(type(of: newWeather))

        // Then
        XCTAssertNotNil(newWeather)
        XCTAssert(newWeather.main.temp == number )
    }

    func testWeatherModelWithInit() throws {


        let number = 19.0    
        
        let iniWeather = Weather(19.0)

        //print(iniWeather.main.temp)
        //print(type(of: iniWeather))

        // Then
        XCTAssertNotNil(iniWeather)
        XCTAssert(iniWeather.main.temp == number )
    }
    
}