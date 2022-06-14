//
//  FavoriteModel.swift
//  MovieDb
//
//  Created by Metin Yıldız on 14.06.2022.
//

import Foundation

struct FavoriteModel: Codable, Hashable {
    var contentId: Int?
    var contentUrl: String?
    var contentTitle: String?
    var contentCast: String?
    var contentDate: String?

    init(contentId: Int? = -1, contentUrl: String? = "", contentTitle: String? = "", contentCast: String? = "", contentDate: String? = "") {
        self.contentId = contentId
        self.contentUrl = contentUrl
        self.contentTitle = contentTitle
        self.contentCast = contentCast
        self.contentDate = contentDate
    }
}

extension UserDefaults {
    var favoriteModel: [FavoriteModel] {
        get {
            guard let data = UserDefaults.standard.data(forKey: "favoriteModel") else { return [] }
            return (try? PropertyListDecoder().decode([FavoriteModel].self, from: data)) ?? []
        }
        set {
            UserDefaults.standard.set(try? PropertyListEncoder().encode(newValue), forKey: "favoriteModel")
        }
    }
}
