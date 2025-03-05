//
//  Event2.swift
//  Project Falcon V4
//
//  Created by Daniel Da Silva Mullane on 11/14/24.
//


import Foundation

class Event2 {

    var sportTitle: String

    var time: String
    
    //var date: String

    var homeOrAway: String

    var location: String

    var opposingTeam: String

    

    init(sportTitle: String, time: String, homeOrAway: String, location: String, opposingTeam: String) {

        self.sportTitle = sportTitle

        self.time = time

        self.homeOrAway = homeOrAway

        self.location = location

        self.opposingTeam = opposingTeam

    }

}

