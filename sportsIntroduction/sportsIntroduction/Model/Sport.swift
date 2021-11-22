//
//  Sport.swift
//  foodpin
//
//  Created by Tsuen Hsueh on 2021/11/8.
//

import Foundation

struct Sport: Hashable {
    var name: String = ""
    var competition: String = ""
    var players: String = ""
    var poster: String = ""
    var image: String = ""
    var isFavorite: Bool = false
}

extension Sport {
    static func generateData( sourceArray: inout [Sport] ) {
        sourceArray = [
            Sport(name: "baseball", competition: "comp: MLB", players: "Players: 9", poster: "baseball_photo.jpg", image: "baseball.png", isFavorite: false),
            Sport(name: "basketball", competition: "comp: NBA", players: "Players: 5", poster: "basketball_photo.jpg", image: "basketball.png", isFavorite: false),
            Sport(name: "football", competition: "comp: EFL", players: "Players: 11", poster: "football_photo.jpg", image: "football.png", isFavorite: false),
            Sport(name: "swim", competition: "comp: FINA", players: "Players: 1", poster: "swim_photo.jpg", image: "swim.png", isFavorite: false),
            Sport(name: "tennis", competition: "comp: ATP", players: "Players: 1, 2", poster: "tennis_photo.jpg", image: "tennis.png", isFavorite: false),
            Sport(name: "tabletennis", competition: "comp: WTTC", players: "Players: 1, 2", poster: "tabletennis_photo.jpg", image: "tabletennis.png", isFavorite: false),
            Sport(name: "other", competition: "comp: unknown", players: "unknown", poster: "other_photo.jpg", image: "other.png", isFavorite: false)
        ]
    }
}
