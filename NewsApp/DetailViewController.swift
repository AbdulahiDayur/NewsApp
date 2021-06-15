//
//  DetailViewController.swift
//  NewsApp
//
//  Created by Abdul Dayur on 6/14/21.
//

import UIKit
import WebKit

class DetailViewController: UIViewController, WKNavigationDelegate {
    
    @IBOutlet var webView: WKWebView!
    
    var detailItem: Article?
    
    override func loadView() {
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let detailItem = detailItem else {return}
        
        let urlString = detailItem.url
        
        let url = URL(string: urlString!)
        
        guard url != nil else {
            print("Cannot load url object")
            return
        }
        
        webView.load(URLRequest(url: url!))
        webView.allowsBackForwardNavigationGestures = true
        
        
//        let html = """
//        <html>
//        <head>
//        <meta name="viewport" content="width=device-width, initial-scale=1">
//        <style> body { font-size: 150%; } </style>
//        </head>
//        <body>
//        \(detailItem.url)
//        </body>
//        </html>
//        """
//
//        webView.loadHTMLString(html, baseURL: nil)
    }

}
