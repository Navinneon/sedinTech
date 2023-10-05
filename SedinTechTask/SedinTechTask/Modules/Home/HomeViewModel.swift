//
//  HomeViewModel.swift
//  SedinTechTask
//
//  Created by Navin Kumar R on 05/10/23.
//

import Foundation

class HomeViewModel {
    
    var data: [HomeModel] = []
    let network = NetworkManager.shared
    
    func loadData(path: String, completion: @escaping (Result<[HomeModel], Error>) -> Void) {
        network.fetchData(path: path) { result in
            switch result {
            case .success(let data):
                do {
                    let decoder = JSONDecoder()
                    let data = try decoder.decode([HomeModel].self, from: data)
                    completion(.success(data))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
