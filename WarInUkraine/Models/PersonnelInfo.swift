//
//  personnelInfo.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 16.07.2022.
//

import Foundation

struct PersonnelInfo: Decodable {
    let date: String
    let day: Int
    let personnel: Int
    let description: String
    let prisonersOfWar: Int?

    enum CodingKeys: String, CodingKey{
        case date, day, personnel
        case description = "personnel*"
        case prisonersOfWar = "POW"
    }
}

