//
//  EventControllerII.swift
//  Project Falcon V4
//
//  Created by Daniel Da Silva Mullane on 11/15/24.


/*

 import UIKit
 import WebKit
 import SwiftSoup
 
 class EventControllerII: UIViewController, WKNavigationDelegate {
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

     }
     
     func handleScrapedData(_ data: String) {
         parseChunk = ParseChunk(scrapedData: data)
         parseChunk.parseMonth()
         //parseChunk.printInput()
         
         
         // Replace this with your provided text

         let text = data
         let lines = text.components(separatedBy: .newlines)
         var events: [Event2] = []



         var i = 0
         while i < lines.count {

             let line = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)

             let sportTitlePattern = #"^[A-Z ]+- [A-Z]+, [A-Z]+$"#

             let regex = try! NSRegularExpression(pattern: sportTitlePattern)

             let range = NSRange(location: 0, length: line.utf16.count)

             

             if regex.firstMatch(in: line, options: [], range: range) != nil {

                 // Found a sport title

                 let sportTitle = line

                 

                 // Get the time

                 i += 1
                 guard i < lines.count else { break }
                 let time = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)

                 

                 // Get Home or Away

                 i += 1
                 guard i < lines.count else { break }
                 let homeOrAway = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)

                 

                 // Get location

                 i += 1
                 guard i < lines.count else { break }
                 var location = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)

                 // Remove "Playing Fields - " prefix if present

                 if location.hasPrefix("Playing Fields - ") {
                     location = location.replacingOccurrences(of: "Playing Fields - ", with: "")
                 }

                 

                 // Get the line with opposing team

                 i += 1
                 guard i < lines.count else { break }
                 let opposingLine = lines[i].trimmingCharacters(in: .whitespacesAndNewlines)

                 

                 // Extract opposing team name from the line

                 var opposingTeam = ""
                 if let vsRange = opposingLine.range(of: "vs ") {
                     opposingTeam = String(opposingLine[vsRange.upperBound...]).trimmingCharacters(in: .whitespacesAndNewlines)
                 }

                 

                 // Create an Event object and add it to the list

                 let event = Event2(
                     sportTitle: sportTitle,
                     time: time,
                     homeOrAway: homeOrAway,
                     location: location,
                     opposingTeam: opposingTeam
                 )

                 events.append(event)

             } else {
                 i += 1
             }

         }


         var labelText = ""

         // Print out the events

         for event in events {
             labelText += "---------------------------------\n"
             labelText += "Sport Title: \(event.sportTitle)\n"
             labelText += "Time: \(event.time)"
             labelText += "Home or Away: \(event.homeOrAway)\n"
             labelText += "Location: \(event.location)\n"
             labelText += "Opposing Team: \(event.opposingTeam)\n"
             labelText += "---------------------------------\n\n"
             
         }
         
         for event in parseChunk.getEvents() {
             labelText += "\(event.getDayNum()) Nov - " + event.getName() + "\n"
         }
         
         
         eLab.text = labelText
         
         
         
         
         
         

     }
     
     
 }


*/
