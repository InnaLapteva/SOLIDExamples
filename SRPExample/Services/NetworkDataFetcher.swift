//
//  NetworkDataFetcher.swift
//  SRPExample
//
//  Created by Инна Лаптева on 02.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import Foundation

protocol DataFetcher {
     func fetchGenericJSONData<T: Decodable>(urlString: String, complition: @escaping (T?) -> Void)
}

class NetworkDataFetcher: DataFetcher {
    
    var networkService: Network
    
    init(networkService: Network = NetworkService()) {
        self.networkService = networkService
    }
    
    func fetchGenericJSONData<T: Decodable>(urlString: String, complition: @escaping (T?) -> Void) {
        networkService.request(urlString: urlString) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                complition(nil)
            } else {
                let decode = self.decodeGenericJSON(type: T.self, from: data)
                complition(decode)
            }
        }
        
    }
    
    func decodeGenericJSON<T: Decodable>(type: T.Type, from data: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = data else { return nil }
        do {
            let objects = try? decoder.decode(type.self, from: data)
            return objects
        } catch let jsonError {
            print(jsonError)
            return nil
        }
    }
}
