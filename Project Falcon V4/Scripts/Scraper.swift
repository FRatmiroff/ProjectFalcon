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
    var scrapedData: String? // Property to hold the scraped data
    
    override init() {
        super.init()
        webView = WKWebView()
        webView.navigationDelegate = self
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
            if let result = result as? String {
                self.scrapedData = result // Store the scraped data
                self.printScrapedData() // Call a method to print the data
            } else if let error = error {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    // Method to print the scraped data
    func printScrapedData() {
        if let data = scrapedData {
            print("Scraped Data: \(data)")
            
//            let parsedList = parseToList(from: scrapedData)
//
//            // Print out the parsed list
//            for (index, line) in parsedList.enumerated() {
//                if(
//            }
            
        }
    }
}
