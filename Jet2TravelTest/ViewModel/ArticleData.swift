//
//  UserEncoding.swift
//  Jet2TravelTest
//
//  Created by Prerna Karvekar on 28/04/20.
//  Copyright © 2020 Prerna Chavan. All rights reserved.
//

import UIKit

struct ArticleData: Codable {
    let user: [User]
    let media: [Media]
    let createdAt: String
    let content: String
    let likes: Int
    let comments: Int

}

struct User: Codable {
    let name: String
    let avatar: String
    let lastname: String
    let designation: String
}

struct Media: Codable {
    let image: String
    let title: String
}
