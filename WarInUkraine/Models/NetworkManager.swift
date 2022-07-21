//
//  NetworkManager.swift
//  WarInUkraine
//
//  Created by Михаил Фролов on 16.07.2022.
//

import Foundation
protocol NetworkDataProvider {
    func requestData (urlString: String, completion: @escaping (Data?, Error?)-> Void)
}

class NetworkManager: NetworkDataProvider {
    func requestData(urlString: String, completion: @escaping (Data?, Error?) -> Void) {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            DispatchQueue.main.async {
                guard let data = data else {
                    completion(nil, error)
                    return
                }
                completion(data, nil)
            }
        }.resume()
    }
}
