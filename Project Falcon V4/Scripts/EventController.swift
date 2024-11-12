//
//  EventsController.swift
//  Project Falcon V4
//
//  Created by Daniel Da Silva Mullane on 10/16/24.
//

 import UIKit
 import WebKit
 import SwiftSoup
 
 class EventController: UIViewController, WKNavigationDelegate {
     // Schedule ViewController
  
     var eventScraper: Scraper!
     var parseChunk: ParseChunk!
     
     var scrapedDataString: String?
  
     @IBOutlet weak var eLab: UILabel!
     
     override func viewDidLoad() {
         super.viewDidLoad()

         eventScraper = Scraper()
         
         
         eventScraper?.onDataScraped = { [weak self] data in
             guard let self = self, let scrapedData = data else { return }
             
             self.scrapedDataString = scrapedData
             self.handleScrapedData(scrapedData)
         }
         
         if let url = URL(string: "https://www.palmertrinity.org/news--calendar/calendar") {
             eventScraper?.scrapeData(from: url)
         }
         
         
         
         
         // Start scraping and printing from the WebScraper class
         
         /*
         webScraper.loadWebsite(urlString: "https://www.palmertrinity.org/news--calendar/calendar")
         */
          
         print("Event Screen Loaded")
         
         print("Second Check")

         
     }
     
     func handleScrapedData(_ data: String) {
         parseChunk = ParseChunk(scrapedData: data)
         parseChunk.parseMonth()
       //  parseChunk.printInput()
         
         eLab.text = data
         
         
        
         // Method to display data to Events Page
         
         
         //print("Scraped Data: \(data)")
         

     }
     
     
 }
