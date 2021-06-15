//
//  CacheManager.swift
//  NewsApp
//
//  Created by Abdul Dayur on 6/14/21.
//

import Foundation

class CacheManager {
    
    static var imageDictionary = [String:Data]()
    
    static func saveData(_ url: String, _ imageData: Data) {
        
        // Save image data along with the url
        imageDictionary[url] = imageData
    }
    
    static func retrieveData(_ url: String) -> Data? {
        
        // Return the saved image data or nil
        return imageDictionary[url]
    }
}
