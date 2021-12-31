import CoreLocation

struct WeatherManager {
    func getCurrentWeather(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws {
        guard let url = URL(string: "api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=15a5654a58f6e0dbd6b1ee160786128a") else { fatalError("Missing URL") }
    }
}
