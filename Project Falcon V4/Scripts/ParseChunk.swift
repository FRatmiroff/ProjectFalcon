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
            }
            
            // Gets all uppercased lines (for events)
            else if line == line.uppercased() && line != "" && line.range(of: #"\d"#, options: .regularExpression) == nil && line.count > 3 {
                 let temp = Event(name: line, dayNum: daysCount + 1)
                _events.append(temp)
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
    
    func printInput(){
        print(inputString)
    }
}
