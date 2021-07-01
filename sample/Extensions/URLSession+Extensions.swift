//
//  URLSession+Extensions.swift
//  sample
//
//  Created by FeedMyTummy on 7/1/21.
//

import Foundation

// This just narrows down the possible states into 2. Succeess and failure. The URLSession API is from the old days. Thus, a bit awkward.
extension URLSession {
    
    func dataTask(with url: URL, handler: @escaping (Result<Data, Error>) -> Void) -> URLSessionDataTask {
        dataTask(with: url) { data, _, error in
            if let error = error {
                handler(.failure(error))
            } else {
                handler(.success(data ?? Data()))
            }
        }
    }
}
