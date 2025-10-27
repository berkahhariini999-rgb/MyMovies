//
//  ApiConstructor.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation

typealias Parameters = [String: String]

struct ApiConstructor {
    
    let endpoint: Endpoint
    var params: Parameters = [:]
}

