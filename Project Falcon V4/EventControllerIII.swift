//
//  ScrollViewViewController.swift
//  Project Falcon V4
//
//  Created by Dominic Durso on 11/20/24.
//

import UIKit

class EventControllerIII: UIViewController {
    
    
    
    var eventScraper: Scraper!
    var parseChunk: ParseChunk!
    
    var scrapedDataString: String?
    @IBOutlet weak var eLab: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let value = DataManager.shared.globalData
        self.handleScrapedData(value)
        
        // Set up the UIScrollView
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .white
        view.addSubview(scrollView)
        
        // Constrain the scrollView to the edges of the view
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -12)
        ])
        
        // Set up the UILabel
        
        eLab.translatesAutoresizingMaskIntoConstraints = false
        eLab.numberOfLines = 0 // Allows multi-line content
        
        
        eLab.font = UIFont.systemFont(ofSize: 16)
        
        scrollView.addSubview(eLab)
        
        // Constrain the label to the scrollView
        NSLayoutConstraint.activate([
            eLab.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16),
            eLab.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16),
            eLab.topAnchor.constraint(equalTo: scrollView.topAnchor),
            eLab.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -16),
            eLab.widthAnchor.constraint(equalTo: scrollView.widthAnchor, constant: -32) // Ensures proper scrolling
        ])
    }
    
    func handleScrapedData(_ data: String) {
        parseChunk = ParseChunk(scrapedData: data)
        parseChunk.parseMonth()
        
        // Months List
        let _ = ["January", "February", "March", "April", "May", "June",
                     "July", "August", "September", "October", "November", "December"]
        
        let events : [Event2] = parseChunk.getEvent2()
        
        
        var labelText = ""
        // Print out the events
        
        let filtering = true
        
        for event in events {
            
            // Filter days that are the same day
            if !filtering || event.date == Calendar.current.component(.day, from: Date()) {
                
                labelText += "\n"
                labelText += "Sport Title: \(event.sportTitle)\n"
                labelText += "Time: \(event.time)\n"
                labelText += "Date: \(event.month + " " + String(event.date))\n"  // Use \(event.date) to get the numerical day, (consider adding day of the week?)
                labelText += "Home or Away: \(event.homeOrAway)\n"
                labelText += "Location: \(event.location)\n"
                labelText += "Opposing Team: \(event.opposingTeam)\n"
                labelText += "\n\n"
                
            }
        }
        
 
        /*
        for event in parseChunk.getEvents() {
            labelText += "\(event.getDayNum()) Mar - " + event.getName() + "\n"
        }
        */
        
        eLab.text = labelText
    }

    
}

