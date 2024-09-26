//
//  ParseDay.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 9/24/24.
//

import UIKit

class ParseDay: NSObject {
    private var _day, _cycleDay : Int
    private var _month : String
    
    init(day: Int, month: String, cycleDay: Int) {
        _day = day
        _month = month
        _cycleDay = cycleDay
    }
    
    func getDay() -> Int {
        return _day
    }
    
    func getMonth() -> String {
        return _month
    }
    
    func getCycleDay() -> Int {
        return _cycleDay
    }
}
