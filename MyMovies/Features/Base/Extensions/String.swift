//
//  String.swift
//  MyMovies
//
//  Created by Iqbal Alhadad on 27/10/25.
//

import Foundation

extension String {
    var capitalizedFirst: String {
        if self.count == 0 { return self }
        return prefix(1).uppercased()+dropFirst()
    }
}
