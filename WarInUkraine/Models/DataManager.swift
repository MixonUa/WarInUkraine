//
//  DataManager.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 18.07.2022.
//

import Foundation

class DataManager {
    private(set) var personnelData = [PersonnelInfo]()
    private(set) var equipmentData = [EquipmentInfo]()
    private var equipmentArrayByDay = [EquipmentInfo]()
    
    private let networkService = NetworkFetchService()
    
    var personnelCount: Int { personnelData.count }
    
    func loadData(completion: @escaping (Error?) -> Void) {
        let group = DispatchGroup()
        var error: Error?
        
        group.enter()
        networkService.requestEquipmentData { [weak self] (equipment, equipmentError) in
            if error == nil {
                error = equipmentError
            }
            if let equipment = equipment {
                self?.equipmentData = equipment.reversed()
            }
            group.leave()
        }
        
        group.enter()
        networkService.requestpersonnelData { [weak self] (personnel, personnelError) in
            if error == nil {
                error = personnelError
            }
            
            if let personnel = personnel {
                self?.personnelData = personnel.reversed()
            }
            
            group.leave()
        }
        
        group.notify(queue: .main) {
            completion(error)
        }
    }
    
    func getpersonnellData(for day: Int) -> PersonnelInfo? {
        if day >= 0, day < personnelData.count {
            return personnelData[day]
        } else {
            return nil
        }
    }
    
    func getEquipmentData(for day: Int) -> EquipmentInfo? {
        if day >= 0, day < equipmentData.count {
            return equipmentData[day]
        } else {
            return nil
        }
    }
}
