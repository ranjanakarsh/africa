//
//  VideoModel.swift
//  Africa
//
//  Created by Ranjan Akarsh on 11/06/21.
//

import Foundation

struct Video : Codable, Identifiable {
    let id: String
    let name: String
    let headline: String
    
    // Computed property
    var thumbnail: String {
        "video-\(id)"
    }
}
