//
//  ParseDay.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 9/20/24.
//

import UIKit
import WebKit
import Foundation

class ParseDay2: NSObject, WKNavigationDelegate {
    private var webView: WKWebView!
    var scrapedData: String? // Property to hold the scraped data
    
    let cycleDays =  ["ABCDE","FGABC”, “DEFGA", "BCDEF", "GABCD", "EFGAB", "CDEFG"]
    let monthNames = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]

    
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
            let currentDay = getCurrentDayOfMonth()
            let currentMonth = getCurrentMonth()
            print("currentDay \(currentDay) , currentMonth \(currentMonth)")
            
//            let parsedList = parseToList(from: scrapedData)
//
//            // Print out the parsed list
//            for (index, line) in parsedList.enumerated() {
//                if(
//            }
            
        }
    }
    
    func getCurrentDayOfMonth() -> Int {
        let today = Date()
        let calendar = Calendar.current
        
        let day = calendar.component(.day, from: today)
        
        return day;
    }
    
    func getCurrentMonth() -> Int {
        let today = Date()
        let calendar = Calendar.current
        
        let month = calendar.component(.month, from: today)
        
        return month;
    }
}
