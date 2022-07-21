//
//  EquipmentInfo.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 16.07.2022.
//

import Foundation

struct EquipmentInfo: Decodable {
    let date: String
    let day: Int
    let aircraft: Int
    let helicopter: Int
    let tank: Int
    let armoredpersonnelCarrier: Int
    let fieldArtillery: Int
    let multipleRocketLauncher: Int
    let militaryAuto: Int?
    let fuelTank: Int?
    let drone: Int?
    let navalShip: Int?
    let antiAircraftWarfare: Int?
    let specialEquipment: Int?
    let mobileSRBM: Int?
    let vehiclesAndFuelTanks: Int?
    let cruiseMissiles: Int?
    
    enum CodingKeys: String, CodingKey {
        case date, day, aircraft, helicopter, tank, drone
        case armoredpersonnelCarrier = "APC"
        case fieldArtillery = "field artillery"
        case multipleRocketLauncher = "MRL"
        case militaryAuto = "military auto"
        case fuelTank = "fuel tank"
        case navalShip = "naval ship"
        case antiAircraftWarfare = "anti-aircraft warfare"
        case specialEquipment = "special equipment"
        case mobileSRBM = "mobile SRBM system"
        case vehiclesAndFuelTanks = "vehicles and fuel tanks"
        case cruiseMissiles = "cruise missiles"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        date = try container.decode(String.self, forKey: .date)
        if let intDay = try? container.decode(Int.self, forKey: .day) {
            day = intDay
        } else if let stringDay = try? container.decode(String.self, forKey: .day) {
            day = Int(stringDay) ?? -1
        } else {
            day = -1
        }
        aircraft = try container.decode(Int.self, forKey: .aircraft)
        helicopter = try container.decode(Int.self, forKey: .helicopter)
        tank = try container.decode(Int.self, forKey: .tank)
        armoredpersonnelCarrier = try container.decode(Int.self, forKey: .armoredpersonnelCarrier)
        fieldArtillery = try container.decode(Int.self, forKey: .fieldArtillery)
        multipleRocketLauncher = try container.decode(Int.self, forKey: .multipleRocketLauncher)
        militaryAuto = try? container.decode(Int.self, forKey: .militaryAuto)
        fuelTank = try? container.decode(Int.self, forKey: .fuelTank)
        drone = try container.decode(Int.self, forKey: .drone)
        navalShip = try container.decode(Int.self, forKey: .navalShip)
        antiAircraftWarfare = try container.decode(Int.self, forKey: .antiAircraftWarfare)
        specialEquipment = try? container.decode(Int.self, forKey: .specialEquipment)
        mobileSRBM = try? container.decode(Int.self, forKey: .mobileSRBM)
        vehiclesAndFuelTanks = try? container.decode(Int.self, forKey: .vehiclesAndFuelTanks)
        cruiseMissiles = try? container.decode(Int.self, forKey: .cruiseMissiles)
    }
}

