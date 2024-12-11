//
//  Scraper.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 9/24/24.
//

import UIKit
import WebKit

class Scraper: NSObject, WKNavigationDelegate {
    private var webView: WKWebView!
    var onDataScraped: ((String?) -> Void)?
    
    override init() {
        super.init()
        webView = WKWebView()
        webView.navigationDelegate = self
    }
    
    func scrapeData(from url: URL) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    
    // Load the webpage and scrape the content
    func loadWebsite(urlString: String) {
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
    
    // WKNavigationDelegate method when page finishes loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        let pageTitle = """
        document.body.innerText;
        """
        webView.evaluateJavaScript(pageTitle) { [weak self] (result, error) in
            guard let self = self else { return }
            if let data = result as? String {
                
                self.onDataScraped?(data)
                
            } else  {
                self.onDataScraped?(nil)
            }
        }
    }
    
    // Method to print the scraped data
    func printScrapedData() {
        if let data = onDataScraped {
     //      print("Scraped Data: \(data)")
        } else {
  //          print("No Valid Data Scraped")
        }
    }
}
