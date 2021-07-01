//
//  APIService.swift
//  sample
//
//  Created by FeedMyTummy on 7/1/21.
//

import Foundation

class APIService {
    
    enum NetworkError: Error {
        case badURL
        case network(Error)
        case decoding(Error)
    }
    
    let urlPath = "" // Omitted for your security.
    
    func getData(_ completion: @escaping (Result<[APIResponse], NetworkError>) -> Void) {
        
        guard let url = URL(string: urlPath) else {
            completion(.failure(.badURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { result in
            
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let data = try decoder.decode([APIResponse].self, from: data) // The data returned is an array. This use [] around the type.
                    completion(.success(data))
                } catch let error {
                    completion(.failure(.decoding(error)))
                }
            case .failure(let error):
                completion(.failure(.network(error)))
            }
        }
        
        task.resume()
    }
}
