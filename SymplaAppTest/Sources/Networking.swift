import Foundation

final class Networking {

    private let baseURL = URL(string: "https://api.sympla.com.br/public/v1.5.1")!
    private let token = ""
    private lazy var session: URLSession = {
        let configuration = URLSessionConfiguration.default
        return URLSession(configuration: configuration)
    }()

    func getEvents(completion: @escaping (Result<EventResponse, Error>) -> Void) {

        let url = baseURL.appendingPathComponent("events")
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue(token, forHTTPHeaderField: "s_token")

        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }

            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601

            do {
                let events = try decoder.decode(EventResponse.self, from: data)
                completion(.success(events))
            } catch {
                completion(.failure(error))
            }
        }

        task.resume()
    }

    enum NetworkError: Error {
        case invalidURL
        case noData
    }
}
