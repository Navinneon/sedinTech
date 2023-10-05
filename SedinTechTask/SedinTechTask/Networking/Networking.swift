//
//  Networking.swift
//  FindingFalcon
//
//  Created by Navin Kumar R on 20/09/23.
//


import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private let baseURL: URL
    private let session: URLSession
    
    private init() {
        
        guard let url = URL(string: "https://api.github.com/repos/Alamofire/Alamofire/") else {
            fatalError("Invalid base URL")
        }
        self.baseURL = url
        self.session = URLSession.shared
    }
    
    func fetchData(path: String, completion: @escaping (Result<Data, Error>) -> Void) {
        
        let fullURL = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: fullURL)
        request.httpMethod = "GET"
        
        let task = session.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else {
                completion(.failure(NSError(domain: "No data received", code: 0, userInfo: nil)))
                return
            }
            completion(.success(data))
        }
        task.resume()
    }
    
   
}

