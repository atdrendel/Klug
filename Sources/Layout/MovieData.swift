import Foundation
import SwiftUI

enum MovieType: String {
    case trending = "Trending"
    case movies = "Movies"
    case shows = "TV Shows"
}

struct Category: Identifiable {
    public let id = UUID().uuidString
    public var type: MovieType
    public var color: Color
    public var movies: [String]

    public init(
        under type: MovieType,
        color: Color = Color.indigo,
        _ movies: [String]
    ) {
        self.type = type
        self.movies = movies
        self.color = color
    }
}

extension Category {
    static var categories: [Category] {[
        
        .init(under: .trending, [
            "Movies",
            "TV Shows"
        ]),

        .init(under: .movies, color: .red, [
            "Now Playing",
            "Incoming",
            "Top Rated",
            "Popular"
        ]),

        .init(under: .shows, color: .mint, [
            "Now Playing",
            "Incoming",
            "Top Rated",
            "Popular"
        ])
    ]}
}
