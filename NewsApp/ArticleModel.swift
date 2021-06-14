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
        getJson()
        
        // Parse the returned JSON into article instances and pass it back to the vc
        // With the Protocol and delegate pattern
//        delegate?.articlesRetrieve([Article]())
    }
    
    func getJson() {
        let apiKey = "3e73bf1df0164755b30b6838105d42e3"
        let urlString = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=" + apiKey
        
        let url = URL(string: urlString)
        guard url != nil else {
            print("Couldnt create url object")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            
            do {
                if error == nil && data != nil {
                    let decoder = JSONDecoder()
                    
                    let array = try decoder.decode(ArticleService.self, from: data!)
                    
                    DispatchQueue.main.async {
                        self.delegate?.articlesRetrieve(array.articles!)
                    }
                }
            } catch {
                print("Could not parse Json")
            }
    
        }
        
        dataTask.resume()
        
    }
    
    
}
