//
//  APIClient.swift
//  nyTimesTopStories
//
//  Created by Howard Chang on 2/6/20.
//  Copyright © 2020 Howard Chang. All rights reserved.
//

import Foundation
import NetworkHelper

struct NYTopStoriesAPIClient {
    static func fetchTopStories(for section: String, completion: @escaping (Result<[Article], AppError>) -> Void ) {
        let endpointURLString = "https://api.nytimes.com/svc/topstories/v2/nyregion.json?api-key=\(Config.apiKey)"
        guard let url = URL(string: endpointURLString) else {
        completion(.failure(.badURL(endpointURLString)))
        return
        }
        let request = URLRequest(url: url)
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let topStories = try JSONDecoder().decode(TopStories.self, from: data)
                    completion(.success(topStories.results))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
    }
}
}
