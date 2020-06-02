//
//  FetchMyData.swift
//  SRPExample
//
//  Created by Инна Лаптева on 02.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import Foundation

class FetchMyData {
    
    var networkDataFetcher: DataFetcher
    
    init(networkDataFetcher: DataFetcher = NetworkDataFetcher()) {
        self.networkDataFetcher = networkDataFetcher
    }
    
    func fetchCountries(completion: @escaping ([Country]?) -> Void) {
        let url = "https://raw.githubusercontent.com/Softex-Group/task-mobile/master/test.json"
        networkDataFetcher.fetchGenericJSONData(urlString: url, complition: completion)
    }
    
    func fetchApps(complition: @escaping (TopApp?) -> Void) {
        let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free/all/10/explicit.json"
        networkDataFetcher.fetchGenericJSONData(urlString: url, complition: complition)
    }
    
    func fetchiPadApps(complition: @escaping (TopApp?) -> Void) {
           let url = "https://rss.itunes.apple.com/api/v1/us/ios-apps/top-free-ipad/all/10/explicit.json"
           networkDataFetcher.fetchGenericJSONData(urlString: url, complition: complition)
       }
    
    //декодирование данных из json в конкертную модель данных
//    func fetchCountries(urlString: String, completion: @escaping ([Country]?) -> Void) {
//        networkDataFetcher.networkService.request(urlString: urlString) { (data, error) in
//            let decoder = JSONDecoder()
//            guard let data = data else { return }
//            let response = try? decoder.decode([Country].self, from: data)
//            completion(response)
//        }
//    }
//
//    func fetchApps(urlString: String,  completion: @escaping (TopApp?) -> Void) {
//        networkDataFetcher.networkService.request(urlString: urlString) { (data, error) in
//            let decoder = JSONDecoder()
//            guard let data = data else { return }
//            let response = try? decoder.decode(TopApp.self, from: data)
//            completion(response)
//        }
//    }
    
    
}
