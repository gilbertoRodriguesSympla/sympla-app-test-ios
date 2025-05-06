import Foundation

struct Event: Codable {
    let id: String
    let referenceId: Int
    let name: String
    let startDate: Date
    let endDate: Date
    let isPrivate: Bool
    let isPublished: Bool
    let isCancelled: Bool
    let imageUrl: URL?
    let eventUrl: URL?
    let address: EventAddress?
    let hostName: String
    let primaryCategory: String
    let secondaryCategory: String


}

struct EventAddress: Codable {
    let name: String
    let street: String
    let number: String
    let city: String
    let state: String
    let country: String
    let latitude: Double
    let longitude: Double
}


