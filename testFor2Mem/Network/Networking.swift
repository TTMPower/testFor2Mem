//
//  Networking.swift
//  testFor2Mem
//
//  Created by Владислав Вишняков on 14.09.2021.
//

import Foundation
import Kingfisher

class Network {
    
    static var task = Network()
    
    func getJsonData(findkey: String, complition: @escaping (ItemsData) -> Void) {
        let urlMain = URL(string: "https://api.unsplash.com/search/collections?client_id=khsAUYKT4yyxQfn7anG53JMxUd8_VoSpgdsSDfGp2Jw&page=1&per_page=70&query=\(findkey)")
        var request = URLRequest(url: urlMain!)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error.debugDescription)
                return
            } else if data != nil {
                do {
                    let decode = try JSONDecoder().decode(ItemsData.self, from: data!)
                    complition(decode)
                } catch let error {
                    print(error.localizedDescription)
                }
            }
        }
        task.resume()
    }
    func filter(array: [Result]) -> [String] {
        var filterArray = [PreviewPhoto]()
        var filter = [String]()
        for el in array {
            filterArray.append(contentsOf: el.previewPhotos!)
        }
        for el in filterArray {
            filter.append((el.urls?.small)!)
        }
        return filter
    }
    func getImage(url: String, complition: @escaping ([ImageResource]) -> Void) {
        if let urls = URL(string: url) {
            var array = [ImageResource]()
            let resourse = ImageResource(downloadURL: urls, cacheKey: url)
            array.append(resourse)
            complition(array)
        }
    }
    
}
