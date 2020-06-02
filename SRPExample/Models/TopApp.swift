//
//  TopApp.swift
//  SRPExample
//
//  Created by Инна Лаптева on 02.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import Foundation

struct TopApp: Decodable {
   let feed: Feed
}

struct Feed: Decodable {
    let title: String
    let results: [Results]
}

struct Results: Decodable {
    let artistName: String
    let name: String
    let artworkUrl100: String
}


