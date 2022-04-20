import Foundation
import UIKit

struct SearchResults: Decodable {
    let total: Int
    let results: [UnsplashPhoto]
    
}

struct UnsplashPhoto: Decodable {
    enum CodingKeys: String, CodingKey {
        case width
        case height
        case urls
     }

    let width: Int
    let height: Int
    let urls: [UrLKing.RawValue:String]
    var croppedImage: UIImage? = nil
    
    enum UrLKing: String {
        case raw
        case full
        case regular
        case small
        case thumb
    }
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.width = try container.decode(Int.self, forKey: .width)
        self.height = try container.decode(Int.self, forKey: .height)
        self.urls = try container.decode([UrLKing.RawValue:String].self, forKey: .urls)
        self.croppedImage = nil
    }
}
