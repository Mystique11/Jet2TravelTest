//
//  Service.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 28/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//

import UIKit

class Service: NSObject {
    
    func downloadDataFromURL(completionHandler: @escaping (Result<[ArticleData], DataError>) -> Void) {
        
        let url = URL(string: articleURL)!
        var request = URLRequest(url: url)
        request.timeoutInterval = 5.0
       
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
                print(error?.localizedDescription ?? "No data")
                completionHandler(.failure(.dataError))

                return
            }
            do {
               let decoded = try JSONDecoder().decode([ArticleData].self, from: data)
                completionHandler(.success(decoded))
                print(decoded)
                
            }catch let error{
                print(error)
            }
            
        }
        
        task.resume()
    }
}
