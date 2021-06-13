//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Ranjan Akarsh on 10/06/21.
//

import Foundation

// JSON Decoder
extension Bundle {
    
    func decode <T: Codable> (_ file: String) -> T {
        // locate json file
        guard let url = self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to load \(file) from the bundle")
        }
        
        // create property for the data
        guard let data = try? Data(contentsOf: url) else {
            fatalError("Failed to load \(file) from the bundle")
        }
        
        // decoder
        let decoder = JSONDecoder()
        
        // decode the data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to parse JSON from \(file)")
        }
        
        return loaded
    }
}
