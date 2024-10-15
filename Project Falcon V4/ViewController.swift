//
//  ViewController.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 8/30/24.
//  Edited by Daniel Da Silva on 10/14/24
//



import UIKit
import WebKit
import SwiftSoup

class ViewController: UIViewController, WKNavigationDelegate {
    // Schedule ViewController
    
    /*
    var webScraper: Scraper!
    var diningScraper : Scraper!
    var parseChunk: ParseChunk!
    @IBOutlet weak var scheduleLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        //  updateScheduleLabel()
        // webScraper = Scraper()
        diningScraper = Scraper()
        //    parseChunk = ParseChunk()
        
        // Start scraping and printing from the WebScraper class
        //webScraper.loadWebsite(urlString: "https://www.palmertrinity.org/news--calendar/calendar")
        diningScraper.loadWebsite(urlString: "https://www.sagedining.com/sites/palmertrinity/menu")
    }
    
    
    
    // Function to update the label text based on the day of the week
    func updateScheduleLabel() {
        // Get the current day of the week (Sunday = 1, Monday = 2, ..., Saturday = 7)
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: Date())
        
        // Determine the schedule based on the day of the week
        switch weekday {
        case 2, 3, 6: // Monday (2), Tuesday (3), Friday (6)
            scheduleLabel.text = "Normal Schedule"
        case 5: // Thursday (5)
            scheduleLabel.text = "Dress Uniform Schedule"
        case 4: // Wednesday (4)
            scheduleLabel.text = "Late Start Schedule"
        default:
            scheduleLabel.text = "No Schedule Available"
        }
    }
    */
    
    // Sagedining ViewController
    
    var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Initialize the WKWebView
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the navigation delegate to self
        webView.navigationDelegate = self
        
        // Add the WKWebView to the view hierarchy
        view.addSubview(webView)
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        // Set constraints for the web view to be within the safe area
                NSLayoutConstraint.activate([
                    webView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                    webView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                    webView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                    webView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
                ])

        
        // Start loading the web page
        if let url = URL(string: "https://www.sagedining.com/sites/palmertrinity/menu") { // Replace with your target URL
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
    // WKNavigationDelegate method to know when the page has finished loading
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("Page loaded")
        extractContent()
    }
    
    func extractContent() {
        // JavaScript to extract desired content
        let js = "document.body.innerHTML" // Modify this JS as needed
        
        webView.evaluateJavaScript(js) { (result, error) in
            if let error = error {
                print("Error extracting content: \(error.localizedDescription)")
                return
            }
            
            if let html = result as? String {
                print("Extracted HTML: \(html)")
                // Process the HTML as needed, e.g., parse with SwiftSoup
                self.parseHTML(html)
            }
        }
    }
    
    func parseHTML(_ html: String) {
        // Optionally, use a library like SwiftSoup to parse HTML
        do {
            let document = try SwiftSoup.parse(html)
            // Example: Extract all links
            let links = try document.select("a[href]")
            for link in links.array() {
                let href = try link.attr("href")
                let text = try link.text()
                print("Link: \(text) - \(href)")
            }
        } catch {
            print("Error parsing HTML: \(error.localizedDescription)")
        }
    }
}

