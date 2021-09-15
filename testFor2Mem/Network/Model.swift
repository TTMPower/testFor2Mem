// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let itemsData = try? newJSONDecoder().decode(ItemsData.self, from: jsonData)

import Foundation

// MARK: - ItemsData
struct ItemsData: Codable {
    var total: Int?
    var totalPages: Int
    var results: [Result]?

    enum CodingKeys: String, CodingKey {
        case total = "total"
        case totalPages = "total_pages"
        case results = "results"
    }
}

// MARK: - Result
struct Result: Codable {
    var tags: [Tag]?
    var coverPhoto: ResultCoverPhoto?
    var previewPhotos: [PreviewPhoto]?

    enum CodingKeys: String, CodingKey {
        case tags = "tags"
        case coverPhoto = "cover_photo"
        case previewPhotos = "preview_photos"
    }
}

// MARK: - ResultCoverPhoto
struct ResultCoverPhoto: Codable {
    var urls: Urls?
    var links: CoverPhotoLinks?


    enum CodingKeys: String, CodingKey {
        case urls = "urls"
        case links = "links"
    }
}

// MARK: - CoverPhotoLinks
struct CoverPhotoLinks: Codable {
    var linksSelf: String?
    var html: String?
    var download: String?
    var downloadLocation: String?

    enum CodingKeys: String, CodingKey {
        case linksSelf = "self"
        case html = "html"
        case download = "download"
        case downloadLocation = "download_location"
    }
}

// MARK: - Urls
struct Urls: Codable {
    var raw: String?
    var full: String?
    var regular: String?
    var small: String?
    var thumb: String?

    enum CodingKeys: String, CodingKey {
        case raw = "raw"
        case full = "full"
        case regular = "regular"
        case small = "small"
        case thumb = "thumb"
    }
}


struct PreviewPhoto: Codable {
    var urls: Urls?

    enum CodingKeys: String, CodingKey {
        case urls = "urls"
    }
}

// MARK: - Tag
struct Tag: Codable {
    var source: Source?

    enum CodingKeys: String, CodingKey {
        case source = "source"
    }
}

// MARK: - Source
struct Source: Codable {
    var coverPhoto: SourceCoverPhoto?

    enum CodingKeys: String, CodingKey {
        case coverPhoto = "cover_photo"
    }
}

// MARK: - SourceCoverPhoto
struct SourceCoverPhoto: Codable {
    var urls: Urls?

    enum CodingKeys: String, CodingKey {
        case urls = "urls"
}
}
