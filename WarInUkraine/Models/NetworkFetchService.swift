//
//  NetworkFetchService.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 16.07.2022.
//

import Foundation

class NetworkFetchService {
    let networkDataProvider: NetworkDataProvider
    
    init(networkDataProvider: NetworkDataProvider = NetworkManager()) {
        self.networkDataProvider = networkDataProvider
    }

    func requestpersonnelData(completion: @escaping ([PersonnelInfo]?, Error?) -> Void) {
        let personnelUrlString = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_personnel.json"
        networkDataProvider.requestData(urlString: personnelUrlString) { (data, error) in
            guard let data = data else { return }
            do {
                let answer = try JSONDecoder().decode([PersonnelInfo].self, from: data)
                DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                    completion(answer, nil)
                })
            } catch(let decodingError) {
                DispatchQueue.main.async { completion(nil, decodingError) }
                print(decodingError)
            }
        }
    }

    
    func requestEquipmentData(completion: @escaping ([EquipmentInfo]?, Error?) -> Void) {
        let equipmentUrlString = "https://raw.githubusercontent.com/MacPaw/2022-Ukraine-Russia-War-Dataset/main/data/russia_losses_equipment.json"
        networkDataProvider.requestData(urlString: equipmentUrlString) { (data, error) in
            guard let data = data else { return }
            do {
                let stringAnswer = String(data: data, encoding: .utf8)!
                let updated = stringAnswer.replacingOccurrences(of: "NaN", with: "null")
                let updatedData = updated.data(using: .utf8)!
                let answer = try JSONDecoder().decode([EquipmentInfo].self, from: updatedData)
                DispatchQueue.main.async { completion(answer, nil) }
            } catch(let decodingError) {
                DispatchQueue.main.async { completion(nil, decodingError) }
                print(decodingError)
            }
        }
    }
}

