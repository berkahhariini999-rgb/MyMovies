//
//  DefaultUrlBuilder.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation

enum DefaultUrlBuilderError: Error {
    case invalidPath,invalidUrl
}

enum DefaultUrlBuilder {
    static func build(api: ApiConstructor) throws -> URL {
        guard var urlComponents = URLComponents(string: api.endpoint.fullPath) else {
            throw DefaultUrlBuilderError.invalidPath
        }
        urlComponents.queryItems = buildQueryParams(api.params, ["api_key": Constant.apiKey])
        guard let url = urlComponents.url else {
            throw DefaultUrlBuilderError.invalidUrl
        }
        return url
    }
    
    static func buildQueryParams(_ params: Parameters...) -> [URLQueryItem] {
        params.flatMap{ $0 }.map {
            URLQueryItem(name: $0.key, value: $0.value)
        }
    }
}
