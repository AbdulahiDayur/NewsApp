//
//  ArticleCell.swift
//  NewsApp
//
//  Created by Abdul Dayur on 6/14/21.
//

import UIKit

class ArticleCell: UITableViewCell {
    
    @IBOutlet var headlineLabel: UILabel!
    
    @IBOutlet var articleImageView: UIImageView!
    
    var articleToDisplay: Article?
    
    func displayArticle(_ article: Article) {
        
        // Clean up the cell before displaying the next article
        articleImageView.image = nil
        headlineLabel.text = ""
        
        // Keep a reference to the article
        articleToDisplay = article
        
        // Set the headline
        headlineLabel.text = articleToDisplay!.title
        
        // Check article actually has image
        guard articleToDisplay!.urlToImage != nil else {
            print("No image")
            return
        }
        
        // Download the display image
        let urlString = articleToDisplay!.urlToImage!
        
        // Check cacheManager before downloading  any image data
        if let imageData = CacheManager.retrieveData(urlString) {
            
            // There is imageData, set the imageView
            articleImageView.image = UIImage(data: imageData)
            
            return
        }
        
        let url = URL(string: urlString)
        
        guard url != nil else {
            print("Can not create url object")
            return
        }
        
        let session = URLSession.shared
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // Save the data into Cache
                CacheManager.saveData(urlString, data!)
            
                // Check if the url string that the data task went off to download
                // Matches the article this cell is set to display
                if self.articleToDisplay!.urlToImage == urlString {
                    DispatchQueue.main.async {
                        self.articleImageView.image = UIImage(data: data!)
                    }
                }
            }
        }
        dataTask.resume()
        
        
    }
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
