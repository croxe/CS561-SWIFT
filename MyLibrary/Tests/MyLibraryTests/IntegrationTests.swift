import XCTest
import MyLibrary
@testable import class MyLibrary.WeatherServiceImpl

final class IntegrationTests: XCTestCase  {
    
    func testWeatherServiceImplWithLucky() async throws {
        // Given
        let service = WeatherServiceImpl()

        let myLibrary = MyLibrary(weatherService: service)
        
        // When
        let isLuckyNumber = await myLibrary.isLucky(8)

        // Then
        
        XCTAssertNotNil(isLuckyNumber)
        XCTAssert(isLuckyNumber == true)
    }

    func testWeatherServiceImplWithUnlucky() async throws {
        // Given
        let service = WeatherServiceImpl()

        let myLibrary = MyLibrary(weatherService: service)

        // When
        let isLuckyNumber = await myLibrary.isLucky(7)

        // Then
        XCTAssertNotNil(isLuckyNumber)
    }

    func testWeatherServiceImplWithZero() async throws {
        // Given
        let service = WeatherServiceImpl()

        let myLibrary = MyLibrary(weatherService: service)

        // When
        let isLuckyNumber = await myLibrary.isLucky(0)

        // Then
        XCTAssertNotNil(isLuckyNumber)
    }

    func testWeatherServiceImplWithEighty() async throws {
        // Given
        let service = WeatherServiceImpl()

        let myLibrary = MyLibrary(weatherService: service)

        // When
        let isLuckyNumber = await myLibrary.isLucky(80)

        // Then
        XCTAssertNotNil(isLuckyNumber)
    }
    
}
