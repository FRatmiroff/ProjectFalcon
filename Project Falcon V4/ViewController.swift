//
//  ViewController.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 8/30/24.
//

import UIKit

class ViewController: UIViewController {
    var webScraper: Scraper!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        webScraper = Scraper()
        
        // Start scraping and printing from the WebScraper class
        webScraper.loadWebsite(urlString: "https://www.palmertrinity.org/news--calendar/calendar")
    }
}

