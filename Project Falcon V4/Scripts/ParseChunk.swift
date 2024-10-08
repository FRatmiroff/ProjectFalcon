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
    private var inputString = """
    This is the first line
    This is second line
    This third line
    """
    
//    init(scrapedData: String)
//    {
//        // parseMonth(scrapedData)
//    }
    
//    func parseMonth(scrapedData: String) {
//        var lines : [String] = []
//        let stringArray = scrapedData.components(separatedBy: "\n")
//
//        var index = 0;
//
//        while index < stringArray.count {
//            lines.append(stringArray[index])
//            index += 1
//        }
//    }
    
    func parseMonth() {
        var lines : [String] = []
        let stringArray = inputString.components(separatedBy: "\n")
        
        var index = 0;
        
        while index < stringArray.count {
            lines.append(stringArray[index])
            index += 1
        }
        
        print(lines)
    }
}
