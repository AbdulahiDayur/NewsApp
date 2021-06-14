//
//  ViewController.swift
//  NewsApp
//
//  Created by Abdul Dayur on 6/13/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        
        // Get the articles from the article model
        model.getArticles()
    }


}


extension ViewController: ArticleModelProtocol{
    
    // Mark: - Article Model Protocol Methods
    
    func articlesRetrieve(_ article: [Article]) {
        
        self.articles = article
        print(article[0].description!)
    }
}

