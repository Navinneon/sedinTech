//
//  HomeModel.swift
//  SedinTechTask
//
//  Created by Navin Kumar R on 05/10/23.
//

import Foundation

struct HomeModel: Codable {

    let user: User?
    let createdAt: String?
    let title: String?

    enum CodingKeys: String, CodingKey {
        case user, title
        case createdAt = "created_at"
    }
}

struct User: Codable {
    let login: String?
    let avatarURL: String?

    enum CodingKeys: String, CodingKey {
        case login
        case avatarURL = "avatar_url"
    }
}
