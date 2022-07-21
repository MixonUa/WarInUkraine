//
//  ChosenDayInformationViewController.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 20.07.2022.
//

import UIKit

class ChosenDayEquipmentInformationViewController: UIViewController {
    @IBOutlet weak var informationStackView: UIStackView!
    var chosenEquipment: EquipmentInfo?
    var EquipmentInformationLines = [EquipmentInformationLine]()
    
    override func viewDidLoad() {
        EquipmentInformationLines = []
        super.viewDidLoad()
        
        guard let item = chosenEquipment else { return }
        createEquipmentInformationLine(title: "Aircrafts loses -", quantity: item.aircraft, imageName: "aircraft")
        createEquipmentInformationLine(title: "Helicopters loses -", quantity: item.helicopter, imageName: "helicopter")
        createEquipmentInformationLine(title: "Tanks loses", quantity: item.tank, imageName: "tank")
        createEquipmentInformationLine(title: "Armored personnel carriers loses -", quantity: item.armoredpersonnelCarrier, imageName: "btr")
        createEquipmentInformationLine(title: "Field artilleries loses -", quantity: item.fieldArtillery, imageName: "artillery")
        createEquipmentInformationLine(title: "Multiple rocket launchers loses -", quantity: item.multipleRocketLauncher, imageName: "mrl")
        if let military = item.militaryAuto {
            createEquipmentInformationLine(title: "Military autos loses -", quantity: military, imageName: "burned_car")
        }
        if let fuel = item.fuelTank {
            createEquipmentInformationLine(title: "Fuel tanks loses -", quantity: fuel, imageName: "fuel_truck")
        }
        if let drone = item.drone {
            createEquipmentInformationLine(title: "Drones loses -", quantity: drone, imageName: "drone")
        }
        if let navalShip = item.navalShip {
            createEquipmentInformationLine(title: "Naval ships loses -", quantity: navalShip, imageName: "naval_ship")
        }
        if let antiAircraft = item.antiAircraftWarfare {
            createEquipmentInformationLine(title: "Anti aircraft warfares loses -", quantity: antiAircraft, imageName: "anti_aircraft")
        }
        if let special = item.specialEquipment {
            createEquipmentInformationLine(title: "Special equipment loses -", quantity: special, imageName: "special_equipment")
        }
        if let srbm = item.mobileSRBM {
            createEquipmentInformationLine(title: "Mobile SRBM loses -", quantity: srbm, imageName: "srbm")
        }
        if let vehicles = item.vehiclesAndFuelTanks {
            createEquipmentInformationLine(title: "Vehicles and fuel tanks loses -", quantity: vehicles, imageName: "vehicles")
        }
        if let missiles = item.cruiseMissiles {
            createEquipmentInformationLine(title: "Cruise missiles loses -", quantity: missiles, imageName: "missile")
        }
        addEquipmentInformationLines(array: EquipmentInformationLines)
    }
    
    private func createEquipmentInformationLine(title: String, quantity: Int, imageName: String) {
        let newLine = EquipmentInformationLine(title: title, quantity: quantity, imageName: imageName)
        EquipmentInformationLines.append(newLine)
    }
    
    private func addEquipmentInformationLines(array: [EquipmentInformationLine]) {
        array.forEach { (line) in
            informationStackView.addArrangedSubview(line)
            line.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                line.heightAnchor.constraint(equalToConstant: 160)
            ])
        }
    }
}

