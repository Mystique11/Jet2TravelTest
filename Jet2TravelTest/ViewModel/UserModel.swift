//
//  UserModel.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 28/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//

import UIKit
import CoreData

class UserModel: NSObject {
    
    var service = Service()
    let databaseModel: DataBaseModel
    
    override init() {
        databaseModel = DataBaseModel()
        super.init()
    }
    
    func downloadData(completionHandler: @escaping (Bool) -> Void) {
        service.downloadDataFromURL() { result in
            
            DispatchQueue.main.async {
                
                switch result {
                case .success(let entries):
                    print("\(entries.count): Received entries.")
                    self.databaseModel.insertIntoDataBase(entries: entries)
                    completionHandler(true)
                case .failure(let error):
                    print(error.localizedDescription)
                    completionHandler(false)
                    
                }
            }
        }
    }
    
    func loadData() -> [Article]{
        databaseModel.fetchFromDatabase()
        return databaseModel.articles
    }
    
}
