//
//  ViewController.swift
//  NewsApp
//
//  Created by Abdul Dayur on 6/13/21.
//

import UIKit

class ViewController: UIViewController, ArticleModelProtocol {
    
    var model = ArticleModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.delegate = self
        
        // Get the articles from the article model
        model.getArticles()
    }
    
    // Mark: - Article Model Protocol Methods
    
    func articlesRetrieve(_ article: [Article]) {
        print("Articles returned from model")
    }


}

