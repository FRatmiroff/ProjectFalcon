//
//  LabelController.swift
//  Project Falcon V4
//
//  Created by Dominic Durso on 10/7/24.
//
import UIKit
import WebKit
import SwiftSoup
class LabelController: UIViewController, WKNavigationDelegate {

    var webScraper: Scraper!
    var diningScraper : Scraper!
    var parseChunk: ParseChunk!
    
    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var periods: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        webScraper = Scraper()
        parseChunk = ParseChunk()
        
        parseChunk.parseMonth()
        updateScheduleLabel()
        // Start scraping and printing from the WebScraper class
        webScraper.loadWebsite(urlString: "https://www.palmertrinity.org/news--calendar/calendar")
    }
    
    
    
    // Function to update the label text based on the day of the week
    func updateScheduleLabel() {
        
        // Get the current day of the week (Sunday = 1, Monday = 2, ..., Saturday = 7)
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: Date())
        
        // DateFormatter to get abbreviated day and current date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, MMM d" // Format: "Mon, Oct 3"
            let currentDate = dateFormatter.string(from: Date())
            
            // Update the date label
            dateLabel.text = currentDate
        
        // Determine the schedule based on the day of the week
        switch weekday {
        case 2, 3, 6: // Monday (2), Tuesday (3), Friday (6)
            lab.text = "Normal Schedule"
            descLabel.text = ""
            periods.text = getLabelString()
        case 5: // Thursday (5)
            lab.text = "Dress Uniform Schedule"
            descLabel.text = "- No Advisory"
            periods.text = getLabelString()
        case 4: // Wednesday (4)
            lab.text = "Late Start Schedule"
            descLabel.text = "- No Advisory\n- No Flex"
            periods.text = getLabelString()
        default:
            lab.text = "No Schedule Available"
        }
        
    }
    func getLabelString() -> String {
        var ret: String = ""
        let per = parseChunk.getPeriods()
        for String in per {
            ret += String + " "
        }
        return ret
    }
}
