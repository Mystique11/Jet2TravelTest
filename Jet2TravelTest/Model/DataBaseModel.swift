//
//  DataBaseModel.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 29/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//

import UIKit
import CoreData

class DataBaseModel: NSObject {
    
    var articles: [Article] = []
    
    func insertIntoDataBase(entries: [ArticleData]) {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        
        
        for entry in entries {
            
            if let user = entry.user.first {
                
                if !isExist(name: user.name){
                    
                    let entity =
                        NSEntityDescription.entity(forEntityName: "Article",
                                                   in: managedContext)!
                    let article = Article(entity: entity,
                                          insertInto: managedContext)
                    
                    article.setValue(entry.content, forKeyPath: "content")
                    article.setValue(entry.createdAt, forKeyPath: "createdAt")
                    article.setValue(entry.likes, forKeyPath: "likes")
                    article.setValue(entry.comments, forKeyPath: "comments")
                    article.setValue(entry.media.first?.image, forKeyPath: "articleImage")
                    article.setValue(entry.user.first?.avatar, forKeyPath: "avatar")
                    article.setValue(entry.user.first?.designation, forKeyPath: "designation")
                    
                    let name = entry.user.first!.name + " " + entry.user.first!.lastname
                    article.setValue(name, forKeyPath: "userName")
                    
                    do {
                        try managedContext.save()
                    } catch let error as NSError {
                        print("Could not save. \(error), \(error.userInfo)")
                    }
                }
            }
        }
    }
    
    func isExist(name: String) -> Bool {
        
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return false
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        fetchRequest.predicate = NSPredicate(format: "userName contains[c] %@",name)
        
        let res = try! managedContext.fetch(fetchRequest)
        return res.count > 0 ? true : false
    }
    
    func fetchFromDatabase(){
        guard let appDelegate =
            UIApplication.shared.delegate as? AppDelegate else {
                return
        }
        let managedContext =
            appDelegate.persistentContainer.viewContext
        let articlesFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Article")
        
        do {
            let fetchedArticles = try managedContext.fetch(articlesFetch) as! [Article]
            self.articles = fetchedArticles
        } catch {
            fatalError("Failed to fetch employees: \(error)")
        }
    }
}
