//
//  MovieCardType.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//


import Foundation

enum MovieCardType {
    case poster, grid
}

extension MovieCardType {
    var widthPercent:Double {
        switch self {
            case .poster:
            return 0.45
        case .grid:
            return 0.30
        }
    }
    
    var heightPercent:Double {
        switch self {
        case .poster:
            return 0.60
        case .grid:
            return 0.30
        }
    }
}
