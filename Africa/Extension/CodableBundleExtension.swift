//
//  CodableBundleExtension.swift
//  Africa
//
//  Created by Apptycoons on 05/04/2024.
//

import Foundation

extension Bundle{
    func decode<T: Codable>(_ file : String) -> T {
        // 1. Locate the JSON file
        guard let url =  self.url(forResource: file, withExtension: nil) else {
            fatalError("Failed to locate \(file) in bundle")
        }
        
        // 2. Create property for data
        guard let data = try? Data(contentsOf: url) else{
            fatalError("Failed to load \(file) from bundle.")
        }
        
        // 3. Create a decoder
        let decoder = JSONDecoder()
        
        // 4. Create a property for decoded data
        guard let loaded = try? decoder.decode(T.self, from: data) else {
            fatalError("Failed to decode \(file) from bundle.")
        }
        
        // 5. Return the ready-to-use data
        return loaded
    }
}
