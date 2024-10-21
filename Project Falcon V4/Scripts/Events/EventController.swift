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
  
     @IBOutlet weak var scheduleLabel: UILabel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         eventScraper = Scraper()
         
         // Start scraping and printing from the WebScraper class
         eventScraper.loadWebsite(urlString: "https://www.palmertrinity.org/news--calendar/calendar")
     }
     
 }
