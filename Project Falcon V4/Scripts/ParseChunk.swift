//
//  ParseChunk.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 9/24/24.
//

import UIKit
import Foundation

class ParseChunk: NSObject {
    private var _parsedDay : [ParseDay] = []
    private var _events : [Event] = []
    private var _sportEvents : [Event2] = []
    private var todayIndex : Int = 0
    private var _periods : [String] = []
    private var inputString = ""
    
    init(scrapedData: String) {
        inputString = scrapedData
    }
    
    func intToMonth(intInQuestion: Int) -> String {
        let months = ["JAN", "FEB", "MAR", "APR", "MAY", "JUN",
                      "JUL", "AUG", "SEP", "OCT", "NOV", "DEC"]
        return months[ (intInQuestion-1) ]
    }
    
    func parseMonth() {
        var _parsedDays: [String] = []
        let stringArray = inputString.components(separatedBy: "\n")
        
        var dayChunks : [String] = []
        
        var daysCount: Int = 0
        var currentDay: String = ""
        let currentMonthInt: Int = Calendar.current.component(.month, from: Date())
        let currentMonth: String = intToMonth(intInQuestion: currentMonthInt)
        var index = 0
        
        var justDay : Int = 0
        var fullDay : String = ""
        
        var parsingDays = false // Flag to start parsing after the first day is detected

        while index < stringArray.count {
            let line = stringArray[index].trimmingCharacters(in: .whitespacesAndNewlines)
            
            
            
            // Check if the line starts with "{Month Name}"
            if line.starts(with: currentMonth) {
                parsingDays = true // Start parsing from the first day onward
                
                // If we are already storing lines for a previous day, add it to _parsedDays
                if !currentDay.isEmpty {
                    _parsedDays.append(currentDay)
                    if let dayNumber = extractDay(from: line, withMonth: currentMonth) {
                        let temp = ParseDay(day: dayNumber, month: currentMonth, chunk: currentDay)
                        
                        dayChunks.append(temp.getChunk())
                        
                        _parsedDay.append(temp)
                        daysCount += 1
                        
                        let day = Calendar.current.component(.day, from: Date())
                        
                        // Update which day is today
                        if dayNumber == day && daysCount > 0 {
                            todayIndex = daysCount
                        }
                    }
                }
                
                // Start a new day with the current line
                currentDay = line + "\n"
                if let _day = extractDay(from: line, withMonth: currentMonth) {
                    justDay = _day
                }
                fullDay = line
                
            } else {
                
                trySportEvent(lines: stringArray, index: index, day: justDay, fday: fullDay)
                
                
                // Gets all uppercased lines (for events)
                if line == line.uppercased() && line != "" && line.range(of: #"\d"#, options: .regularExpression) == nil && line.count > 3 && index > 40 {
                    let temp = Event(name: line, dayNum: daysCount + 1)
                    _events.append(temp)
                }
                
            }
            
            
            if parsingDays {
                // Add line to the current day only if we have started parsing days
                currentDay += line + "\n"
                
                // Stop parsing when we hit the "JUMP TO A DATE" or other irrelevant info
                if line.contains("JUMP TO A DATE") || line.contains("FILTER BY CATEGORY") {
                    break
                }
            }
            
            index += 1
        }
        
        // Add the last day's data if present
        if !currentDay.isEmpty {
            _parsedDays.append(currentDay)
        }
        
        // Update Current Cycle Day
        if todayIndex > 0 {
            let currentCycleDay = _parsedDay[todayIndex].getCycleDay()
            let currentCD = CycleDays.match(day: currentCycleDay)
            let periods = currentCD.getPeriods()
            _periods = periods
        }
        
        for chunk in dayChunks {
    //        print(chunk + "\n")
        }
        
        
        //print(dayChunks)
    }
    
    
    func trySportEvent(lines: [String], index: Int, day: Int, fday: String) {
        var i = index
        while i < index + 2 {
            
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
                    date: day,
                    month: fday,
                    homeOrAway: homeOrAway,
                    location: location,
                    opposingTeam: opposingTeam
                )
                
                _sportEvents.append(event)
                
            } else {
                i += 1
            }
            
        }
    }
    
    
    func extractDay(from line: String, withMonth monthAbbreviation: String) -> Int? {
        let dayString = line.replacingOccurrences(of: monthAbbreviation, with: "")
        
        if let dayNumber = Int(dayString.prefix(while: { $0.isNumber })) {
            return dayNumber
        }
        return nil
    }
    
    /*
    func getCurrentCycleDay() -> Int {
        if todayIndex > 0 {
            let currentCycleDay = _parsedDay[todayIndex].getCycleDay()
            let currentCD = CycleDays.match(day: currentCycleDay)
            let periods = currentCD.getPeriods()
            _periods = periods
            return _parsedDay[todayIndex].getCycleDay()
            
        }
        return 0
    }
     */
    
    func getPeriods() -> [String] {
        return _periods
    }
    
    func getEvents() -> [Event] {
        return _events
    }
    
    func getEvent2() -> [Event2]{
        return _sportEvents
    }
    
    func printInput(){
        print(inputString)
    }
    
}
