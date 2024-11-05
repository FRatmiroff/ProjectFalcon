//
//  ViewController.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 8/30/24.
//
//

 import UIKit
 import WebKit
 import SwiftSoup
 
 class ViewController: UIViewController, WKNavigationDelegate {
     // Schedule ViewController
  
     var webScraper: Scraper!
     var diningScraper : Scraper!
     var parseChunk: ParseChunk!
  
     @IBOutlet weak var scheduleLabel: UILabel!
     
     override func viewDidLoad() {
         super.viewDidLoad()
         updateScheduleLabel()
         webScraper = Scraper()
         
         
         // Start scraping and printing from the WebScraper class
         webScraper.loadWebsite(urlString: "https://www.palmertrinity.org/news--calendar/calendar")
         
        
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
 }
