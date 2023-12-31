//
//  NetworkService.swift
//  ImagesSearch
//
//  Created by Серафима  Татченкова  on 30.03.2022.
//

import Foundation

class NetworkService {
    
    func request(searchTerm: String, completion: @escaping (Data?, Error?) -> Void ) {
        let parameters = self.prepareParams(searchTerm: searchTerm)
        let url = self.createUrl(params: parameters)
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = "GET"
        let task = createDataTask(from: request, completion: completion)
        task.resume()
    }
    
    private func prepareHeader() -> [String:String]? {
        var header = [String: String]()
        header["Authorization"] = "Client-ID R4q4pGcxenebxqxjJyJZEcmgP4unU91qVXvG3F327Rw"
        return header
    }
    
    private func prepareParams(searchTerm: String?) -> [String: String] {
        var parameters = [String:String]()
        parameters["query"] = searchTerm
        parameters["page"] = String(1)
        parameters["per_page"] = String(30)
        return parameters
    }
    
    private func createUrl(params: [String: String]) -> URL {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.unsplash.com"
        components.path = "/search/photos"
        components.queryItems = params.map {
            URLQueryItem(name: $0, value: $1)}
        return components.url!
    }
    
    private func createDataTask(from request: URLRequest, completion: @escaping (Data?, Error?) ->  Void) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                completion(data, error)
            }
        }
    }
}
