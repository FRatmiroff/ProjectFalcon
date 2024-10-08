//
//  ParseDay.swift
//  Project Falcon V4
//
//  Created by Frank Ratmiroff on 9/24/24.
//
import UIKit



class ParseDay: NSObject {

    private var _day : Int

    private var _month, _chunk : String

    

    init(day: Int, month: String, chunk: String) {

        _day = day

        _month = month

        _chunk = chunk

    }

    

    func getDay() -> Int {

        return _day

    }

    

    func getMonth() -> String {

        return _month

    }

    

    func getCycleDay() -> Int {

        if let range = _chunk.range(of: "CYCLE DAY") {

            let substring = _chunk[range]

            print(substring)

        }

        return 0

    }

}
