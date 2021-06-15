//
//  ViewController.swift
//  NewsApp
//
//  Created by Abdul Dayur on 6/13/21.
//

import UIKit

class ViewController: UIViewController{
    
    @IBOutlet var tableView: UITableView!
    
    
    var model = ArticleModel()
    var articles = [Article]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        model.delegate = self
        
        // Get the articles from the article model
        model.getArticles()
    }


}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleCell", for: indexPath) as! ArticleCell
        cell.displayArticle(articles[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = DetailViewController()
        
        vc.detailItem = articles[indexPath.row]
        navigationController?.pushViewController(vc, animated: true)
    }
}


extension ViewController: ArticleModelProtocol{
    
    // Mark: - Article Model Protocol Methods
    
    func articlesRetrieve(_ article: [Article]) {
        
        self.articles = article
        
        tableView.reloadData()
    }
}

