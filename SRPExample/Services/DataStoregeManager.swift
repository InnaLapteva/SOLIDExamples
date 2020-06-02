//
//  DataStoregeManager.swift
//  SRPExample
//
//  Created by Инна Лаптева on 01.06.2020.
//  Copyright © 2020 Инна Лаптева. All rights reserved.
//

import Foundation

class DataStoregeManager {
    
    // Сохранение данных в кеш/базу данных
    func savenameInCache(name: String) {
        print("Your name: \(name) is saved")
    }
    
    // Получать данные из кеша/базы данных
    func getNameFromCache() -> String {
        return "some name"
    }
    
}
