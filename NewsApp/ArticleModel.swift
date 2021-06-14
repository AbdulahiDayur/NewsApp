//
//  ArticleModel.swift
//  NewsApp
//
//  Created by Abdul Dayur on 6/13/21.
//

import Foundation

protocol ArticleModelProtocol {
    
    func articlesRetrieve(_ article: [Article])
}

class ArticleModel {
    
    var delegate: ArticleModelProtocol?
    
    func getArticles() {
        
        // Fire off the request to the API
        
        // Parse the returned JSON into article instances and pass it back to the vc
        // With the Protocol and delegate patteren
        delegate?.articlesRetrieve([Article]())
        
    }
}
