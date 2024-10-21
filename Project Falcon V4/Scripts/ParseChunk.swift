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
    private var todayIndex : Int = 0
    private var _periods : [String] = []
    private var inputString = """
    MyPTS Login
    ABOUT
    arrow
    ADMISSION
    arrow
    ACADEMICS
    arrow
    ARTS
    arrow
    ATHLETICS
    arrow
    STUDENT LIFE
    arrow
    SUPPORT PTS
    arrow
    ENRICHMENT
    arrow
    INQUIRE
    News & Calendar
    arrow
    News
    Calendar
    2024 - 2025 School Calendar
    Events
    arrow
    Parents
    arrow
    Contact Us
    Affiliations
    arrow
    Site Map
    Search
    Calendar
    EVENTS

    OCT1

    1/2 DAY - UPPER SCHOOL STANDARDIZED TESTING
    Katie Lamiell

    MS NO SCHOOL - MIDDLE SCHOOL STUDENT LED CONFERENCES
    Pete Tolmach
    VOLLEYBALL - GIRLS, JV
    6:00 PM
    Away
    Gulliver Preparatory School
    Volleyball - Girls, JV vs Gulliver Prep
    VOLLEYBALL - GIRLS, VARSITY
    7:30 PM
    Away
    Gulliver Preparatory School
    Volleyball - Girls, Varsity vs Gulliver Prep
    OCT2

    ROSH HASHANAH BEGINS AT SUNDOWN (NO ACTIVITIES AFTER SUNDOWN THROUGH 10/4) SUNDOWN)
     
    CYCLE DAY 5
     
    LATE START
    9:00 AM
    LARRY WOOTEN INVITATIONAL
    9:30 AM
    Away
    Larry and Penny Thompson Park

    HAMPDEN SYDNEY COLLEGE VISIT
    1:05 PM
    GOLF - BOYS, MS
    2:30 PM
    Away
    Granada Golf Course
    Golf - Boys, MS vs Ransom Everglades
    VOLLEYBALL - GIRLS, MS JV
    3:30 PM
    Home
    Volleyball - Girls, MS JV vs Florida Christian
    6TH AND 7TH GRADE
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Football - Boys, Middle School (6th, 7th, and 8th) vs Ransom Everglades
    CHEERLEADING - MS
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Cheerleading - MS vs Ransom Everglades
    VOLLEYBALL - GIRLS, MS VARSITY
    4:30 PM
    Home
    Volleyball - Girls, MS Varsity vs Florida Christian
    OCT3

    FALL BREAK - NO SCHOOL
    to 10/4/2024
    OCT4

    FALL BREAK - NO SCHOOL
    to 10/4/2024
    FL RUNNERS INVITATIONAL
    12:00 PM
    Away
    Holloway Park
    FOOTBALL - BOYS, VARSITY
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Football - Boys, Varsity vs Somerset Academy South (Homestead)
    CHEERLEADING - VARSITY
    4:00 PM
    Home
    Somerset Academy South Homestead
    Cheerleading - Varsity vs Somerset Academy South (Homestead)
    OCT5
    FL RUNNERS INVITATIONAL
    12:00 PM
    Away
    Holloway Park
    OCT7

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    CYCLE DAY 6
     
    HOFSTRA UNIVERSITY VISIT
    9:25 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    TEXAS CHRISTIAN UNIVERSITY VISIT
    9:25 AM
    Open to Juniors & Seniors. Please register via your SCOIR account.

    LEHIGH UNIVERSITY VISIT
    11:10 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    UNIVERSITY OF ST ANDREWS VISIT
    1:05 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    WILLIAM & MARY VISIT
    2:15 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    GOLF - BOYS, VARSITY
    2:30 PM
    Away
    Granada Golf Course
    Golf - Boys, Varsity vs TBD
    GOLF - BOYS, MS
    2:45 PM
    Away
    Briar Bay Golf Course
    Golf - Boys, MS vs Gulliver Academy
    DIG PINK
    3:00 PM
    Scrimmage
    Home
    Playing Fields - PTS Gymnasium
    DIG PINK
    4:00 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, MS JV vs Cushman
    DIG PINK
    5:00 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, MS Varsity vs Cushman
    DIG PINK
    5:00 PM
    Home
    Playing Fields - PTS Gymnasium
    Cheerleading - MS vs Cushman
    DIG PINK
    6:00 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, JV vs Mater Brickell
    DIG PINK
    7:30 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, Varsity vs Mater Brickell
    DIG PINK
    7:30 PM
    Home
    Playing Fields - PTS Gymnasium
    Cheerleading - Varsity vs Mater Brickell
    OCT8

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    CYCLE DAY 7
     
    6TH GRADE TRAVEL TO MARINE LAB | INFORMATIONAL MEETING
    8:00 AM to 9:00 AM
    Main Dining Room
    Natalia Zurcher

    BARD COLLEGE VISIT
    8:15 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    INDIANA UNIVERSITY (BLOOMINGTON) VISIT
    9:25 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    PROVIDENCE COLLEGE VISIT
    11:10 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    BABSON COLLEGE VISIT
    11:10 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    NORTHEASTERN UNIVERSITY VISIT
    12:15 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    ADMISSION INFORMATION SESSION AND TOUR
    2:00 PM
    Danny Reynolds

    WELLESLEY COLLEGE VISIT
    2:15 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    PTS INVITATIONAL
    4:00 PM
    Home
    Playing Fields - PTS Kipp Field (Track & Field)
    GOLF - GIRLS, VARSITY
    4:00 PM
    Away
    Biltmore Hotel - Golf Course
    Golf - Girls, Varsity vs Carrollton
    OCT9

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    1/2 DAY FOR ALL SCHOOL - US PARENT/TEACHER/STUDENT CONFERENCE
     
    CYCLE DAY 1
     
    SIMMONS UNIVERSITY VISIT
    9:00 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    LOYOLA MARYMOUNT UNIVERSITY VISIT
    9:00 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    UNIVERSITY OF COLORADO AT BOULDER VISIT
    11:20 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    GOLF - BOYS, MS
    3:00 PM
    Away
    Briar Bay Golf Course
    Golf - Boys, MS vs Westminster Christian
    GOLF - GIRLS, MS
    3:00 PM
    Away
    Briar Bay Golf Course
    Golf - Girls, MS vs Westminster Christian
    VOLLEYBALL - GIRLS, JV
    4:00 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, JV vs Downtown Doral Charter
    SENIOR GAME
    5:30 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, Varsity vs Downtown Doral Charter
    OCT10

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    1/2 DAY FOR ALL SCHOOL - US PARENT/TEACHER/STUDENT CONFERENCE
     
    CYCLE DAY 2
     
    PTPA COFFEE - OPEN FORUM
    8:00 AM
    Main Dining Room
    Denise Gallardo

    SAINT JOSEPH'S UNIVERSITY VISIT
    8:15 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    KENYON COLLEGE VISIT
    9:00 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    EMORY UNIVERSITY VISIT
    9:50 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    PINK INVITATIONAL
    1:45 PM
    Home
    Deering Bay Yacht and Country Club
    Golf - Girls, Varsity vs Westminster Christian
    GOLF - BOYS, VARSITY
    3:30 PM
    Away
    Miami Shores Country Club
    Golf - Boys, Varsity vs Don Soffer Aventura High School
    FOOTBALL - BOYS, MIDDLE SCHOOL (6TH, 7TH, AND 8TH)
    4:00 PM
    Away
    Boca Raton Christian
    Football - Boys, Middle School (6th, 7th, and 8th) vs Boca Raton Christian
    VOLLEYBALL - GIRLS, JV
    4:00 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, JV vs Mater Bay
    VOLLEYBALL - GIRLS, VARSITY
    5:30 PM
    Home
    Playing Fields - PTS Gymnasium
    Volleyball - Girls, Varsity vs Mater Bay
    FOOTBALL - BOYS, VARSITY
    7:00 PM
    Away
    Miami Country Day School
    Football - Boys, Varsity vs Miami Country Day
    CHEERLEADING - VARSITY
    7:00 PM
    Away
    Miami Country Day School
    Cheerleading - Varsity vs Miami Country Day

    9TH GRADE PARENT PARTY
    7:00 PM
    Home of the Wilson Family
    Denise Gallardo
    OCT11

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    CYCLE DAY 3
     
    EMERSON COLLEGE VISIT
    9:25 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    LYNN UNIVERSITY VISIT
    11:10 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    305 CLASSIC
    12:00 PM
    Away
    Larry and Penny Thompson Park

    SARAH LAWRENCE COLLEGE VISIT
    12:15 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    DICKINSON COLLEGE VISIT
    1:05 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    DENISON UNIVERSITY VISIT
    1:05 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    OCT12

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    YOM KIPPUR (10/11 - NO ACTIVITIES AFTER 5:00 PM)
     
    BREAKTHROUGH MIAMI ORIENTATION
    9:00 AM to 2:00 PM
    OCT13

    FALL ANNUAL FUND DRIVE
    to 11/1/2024
    OCT14

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    HOMECOMING WEEK
    to 10/18/2024
    Alexandra Cartaya

    CYCLE DAY 4
     
    BOSTON UNIVERSITY VISIT
    8:15 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    HAMILTON COLLEGE VISIT
    9:25 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    CITY UNIVERSITY OF LONDON VISIT
    11:10 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    DISTRICT QUARTERFINAL
    12:00 PM
    TBD

    COLORADO SCHOOL OF MINES VISIT
    1:05 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    ELON UNIVERSITY VISIT
    2:15 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    GOLF - BOYS, VARSITY
    2:30 PM
    Away
    Granada Golf Course
    Golf - Boys, Varsity vs Riviera Prep
    OCT15

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    HOMECOMING WEEK
    to 10/18/2024
    Alexandra Cartaya

    CYCLE DAY 5
     
    PTPA BOOK CLUB
    8:00 AM
    Keller Lecture Hall
    Denise Gallardo

    BIGHAMTON UNIVERSITY VISIT
    9:25 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    DEPAUL UNIVERSITY VISIT
    11:10 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    DISTRICTS SEMIFINALS
    12:00 PM
    TBD
    SFMSC FINALS
    12:00 PM
    TBD

    LOYOLA UNIVERSITY CHICAGO VISIT
    1:05 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    SUFFOLK UNIVERSITY VISIT
    2:15 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    GOLF - BOYS, VARSITY
    2:30 PM
    Away
    Granada Golf Course
    Golf - Boys, Varsity vs TBD
    GOLF - GIRLS, VARSITY
    3:00 PM
    Away
    Redland Golf & Country Club
    Golf - Girls, Varsity
    vs Carrollton
    vs Florida Christian
    SFMSC CHAMPIONSHIP
    4:30 PM
    Home
    Playing Fields - PTS Kipp Field (Track & Field)
    OCT16

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    HOMECOMING WEEK
    to 10/18/2024
    Alexandra Cartaya

    FALL THESPIAN SHOWCASE
    to 10/17/2024
    One Act
    Celia Potter

    CYCLE DAY 6
    SFMSC TOURNAMENT
    8:00 AM
    Away
    Granada Golf Course
    SFMSC TOURNAMENT
    8:00 AM
    Away
    Granada Golf Course

    LATE START
    9:00 AM

    WORCESTER POLYTECHNIC INSTITUTE VISIT
    9:00 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    MUHLENBERG COLLEGE VISIT
    11:10 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    SUNY AT ALBANY VISIT
    1:05 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    GEORGE WASHINGTON UNIVERSITY VISIT
    2:15 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    OCT17

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    HOMECOMING WEEK
    to 10/18/2024
    Alexandra Cartaya

    FALL THESPIAN SHOWCASE
    to 10/17/2024
    One Act
    Celia Potter

    CYCLE DAY 7
    PALM LEAGUE CHAMPIONSHIP
    9:00 AM
    Away
    Markham Park

    DAVIDSON COLLEGE VISIT
    9:05 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    COLORADO COLLEGE VISIT
    9:05 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    MACALESTER COLLEGE VISIT
    9:05 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    MIDDLEBURY COLLEGE VISIT
    9:05 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    DISTRICT CHAMPIONSHIP
    12:00 PM
    TBD

    COLLEGE OF CHARLESTON VISIT
    2:15 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    FOOTBALL - BOYS, MIDDLE SCHOOL (6TH, 7TH, AND 8TH)
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Football - Boys, Middle School (6th, 7th, and 8th) vs Miami Country Day
    GOLF - BOYS, VARSITY
    4:00 PM
    Away
    Palmetto Golf Course
    Golf - Boys, Varsity vs Ransom Everglades
    CHEERLEADING - MS
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Cheerleading - MS vs Miami Country Day
    OCT18

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    HOMECOMING WEEK
    to 10/18/2024
    Alexandra Cartaya

    HOMECOMING GAME
    Dave Lanham

    CYCLE DAY 1
     
    GEORGE MASON UNIVERSITY VISIT
    9:25 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    SWARTHMORE COLLEGE VISIT
    11:10 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    GOLF - BOYS, VARSITY
    2:00 PM
    Away
    Redland Golf & Country Club
    Golf - Boys, Varsity vs Westminster Christian
    HOMECOMING
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Football - Boys, Varsity vs Everglades Prep Academy
    HOMECOMING
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Cheerleading - Varsity vs Everglades Prep Academy
    HOMECOMING
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Cheerleading - MS vs Everglades Prep Academy

    POST-HOMECOMING ALUMNI RECEPTION
    6:00 PM to 8:00 PM
    Register HERE. Palmer Trinity School is excited to start a new tradition with an unforgettable Homecoming celebration on October 18, 2024! Alumni are invited to attend both the Homecoming Game and Alumni Reception. After the game, join Head of School Patrick Roberts and his wife, Laura, for a family-friendly reception with hors d'oeuvres, sweet treats, and fun games like cornhole and bocce ball.

    *For those attending the football game, we’ll gather at the Alumni Tent after the game and walk over to the Roberts' residence together.
    Isabella Martino
    OCT19

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    HOMECOMING DANCE
    Alexandra Cartaya

    ISEE
    8:00 AM to 1:00 PM
    Registration Building 8 Lobby
    Giovanna Arrien
    OCT20

    FALL ANNUAL FUND DRIVE
    to 11/1/2024
    OCT21

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    6TH GRADE MARINE LAB
    to 10/25/2024
    Off Campus
    Leo Llinas
    6TH GRADE DEERING ESTATE
    to 10/25/2024
    Deering Estate
    Leo Llinas

    CYCLE DAY 2
    OCT22

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    6TH GRADE MARINE LAB
    to 10/25/2024
    Off Campus
    Leo Llinas
    6TH GRADE DEERING ESTATE
    to 10/25/2024
    Deering Estate
    Leo Llinas

    CYCLE DAY 3
     
    SAFETY FIRST: PROTECTING OUR PTS COMMUNITY| PARENT PRESENTATION
    8:00 AM
    Main Dining Room

    SETON HALL UNIVERSITY VISIT
    8:15 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    UNIVERSITY OF MISSISSIPPI
    9:25 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    SACRED HEART UNIVERSITY VISIT
    11:10 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    VIRGINIA POLYTECHNIC INSTITUTE AND STATE UNIVERSITY VISIT
    1:05 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    GOLF - GIRLS, VARSITY
    2:00 PM
    Away
    Granada Golf Course
    Golf - Girls, Varsity vs SLAM Charter School

    UNIVERSITY OF KENTUCKY VISIT
    2:15 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    OCT23

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    6TH GRADE MARINE LAB
    to 10/25/2024
    Off Campus
    Leo Llinas
    6TH GRADE DEERING ESTATE
    to 10/25/2024
    Deering Estate
    Leo Llinas

    CYCLE DAY 4
     
    LATE START
    9:00 AM

    BUCKNELL UNIVERSITY VISIT
    9:00 AM
    Open to Juniors & Seniors. Please register via your SCOIR account.

    FLORIDA INSTITUTE OF TECHNOLOGY VISIT
    11:10 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.

    THE AMERICAN UNIVERSITY OF PARIS VISIT
    1:05 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    BRYANT UNIVERSITY VISIT
    2:15 PM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    AFTER SCHOOL CAMPUS TOUR (TOUR ONLY)
    3:15 PM
    Giovanna Arrien
    OCT24

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    6TH GRADE MARINE LAB
    to 10/25/2024
    Off Campus
    Leo Llinas
    6TH GRADE DEERING ESTATE
    to 10/25/2024
    Deering Estate
    Leo Llinas

    CYCLE DAY 5
     
    RENSSELAER POLYTECHNIC INSTITUTE VISIT
    9:05 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.

    12TH GRADE PARENT PARTY
    7:00 PM
    Home of the Herrera Family
    Denise Gallardo
    OCT25

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    6TH GRADE MARINE LAB
    to 10/25/2024
    Off Campus
    Leo Llinas
    6TH GRADE DEERING ESTATE
    to 10/25/2024
    Deering Estate
    Leo Llinas

    CYCLE DAY 6
     
    UNIVERSITY OF MARYLAND (COLLEGE PARK) VISIT
    11:10 AM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    JR. ORANGE BOWL
    12:00 PM
    Away
    Larry and Penny Thompson Park

    COLLEGE OF THE HOLY CROSS VISIT
    1:05 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    FOOTBALL - BOYS, VARSITY
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Football - Boys, Varsity vs ABF Sports Academy
    CHEERLEADING - VARSITY
    4:00 PM
    Home
    Playing Fields - PTS Montana Field (Main)
    Cheerleading - Varsity vs ABF Sports Academy

    MS HALLOWEEN DANCE
    7:00 PM to 10:00 PM
    Playing Fields - PTS Gymnasium
    Alexandra Cartaya
    OCT26

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    BREAKTHROUGH MIAMI
    OCT27

    FALL ANNUAL FUND DRIVE
    to 11/1/2024
    OCT28

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    CYCLE DAY 7
    DISTRICTS
    12:00 PM
    TBD
    OCT29

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    SCHOOL PICTURE MAKE-UP DAY
    Rooms 8214 & 8215
    Valerie Blattner

    CYCLE DAY 1
     
    CATHOLIC UNIVERSITY OF AMERICA VISIT
    8:15 AM
    Open to Juniors & Seniors.
    Please register to attend via your SCOIR account.
    DISTRICTS
    8:30 AM
    Away

    RIDER UNIVERSITY VISIT
    1:05 PM
    Open to Juniors & Seniors
    Please register to attend via your SCOIR account.
    DISTRICT CHAMPIONSHIP
    4:00 PM
    Home
    Playing Fields - PTS Kipp Field (Track & Field)
    OCT30

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    CYCLE DAY 2
     
    LATE START
    9:00 AM
    OCT31

    FALL ANNUAL FUND DRIVE
    to 11/1/2024

    CYCLE DAY 3
    JUMP TO A DATE

    iCal Feed
    GRID VIEW
    PrevToday Next
    SUN
    MON
    TUE
    WED
    THU
    FRI
    SAT
    29
    30
    1
    2
    3
    4
    5
    6
    7
    8
    9
    10
    11
    12
    13
    14
    15
    16
    17
    18
    19
    20
    21
    22
    23
    24
    25
    26
    27
    28
    29
    30
    31
    1
    2
    FILTER BY CATEGORY

    EVENT CATEGORIES

       Admission
       All School
       Alumni
       Breakthrough Miami
       Campus Store
       Campus Tours
       Chapels and Convocations
       College Counseling
       Community Service/Clubs
       Development
       Experiential Education
       General
       Global Learning
       Middle School
       New Parents
      Parent Book Club
       Performing Arts
       PTPA
       Special Events
       Standardized Testing
       Summer Program
       Sustainability
       Tablet/Laptop Program
      Travel
       Upper School
       Visual Arts
    LOCATION

      Home
      Away
    ATHLETIC SCHEDULES

      Cheerleading - MS
      Cheerleading - Varsity
      Cross Country - Coed, MS
      Cross Country - Coed, Varsity
      Football - Boys, Middle School (6th, 7th, and 8th)
      Football - Boys, Varsity
      Golf - Boys, MS
      Golf - Boys, Varsity
      Golf - Coed, MS Intermediate
      Golf - Girls, MS
      Golf - Girls, Varsity
      Volleyball - Girls, JV
      Volleyball - Girls, MS Intermediate
      Volleyball - Girls, MS JV
      Volleyball - Girls, MS Varsity
      Volleyball - Girls, Varsity
      Basketball - Boys, JV
      Basketball - Boys, MS Intermediate
      Basketball - Boys, MS JV
      Basketball - Boys, MS Varsity
      Basketball - Boys, Varsity
      Basketball - Girls, JV
      Basketball - Girls, MS Varsity
      Basketball - Girls, Varsity
      Cheerleading - MS (Basketball)
      Cheerleading - Varsity (Basketball)
      Soccer - Boys, JV
      Soccer - Boys, MS JV
      Soccer - Boys, MS Varsity
      Soccer - Boys, Varsity
      Soccer - Coed, MS Intermediate
      Soccer - Girls, JV
      Soccer - Girls, MS JV
      Soccer - Girls, MS Varsity
      Soccer - Girls, Varsity
      Baseball - Boys, JV
      Baseball - Boys, MS
      Baseball - Boys, Varsity
      Football (Spring) - Boys, Middle School
      Football (Spring) - Boys, Varsity
      Lacrosse - Boys, JV
      Lacrosse - Boys, MS
      Lacrosse - Girls, MS
      Lacrosse - Girls, Varsity
      Softball - Girls, MS
      Softball - Girls, Varsity
      Tennis - Boys, MS
      Tennis - Boys, Varsity
      Tennis - Coed, MS Intermediate
      Tennis - Girls, MS
      Tennis - Girls, Varsity
      Track and Field - Coed, MS
      Track and Field - Coed, Varsity
    SELECT ALL CLEAR ALL REFRESH
     
    Main Entrance: 8001 SW 184th Street, Miami, FL 33157
    Mailing Address: 7900 SW 176th Street, Miami, FL 33157
    Main:        305.251.2230
    Admission:        305.969.4208
         
    Select Language​▼
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
    
//    func parseMonth() {
//        var lines : [String] = []
//        let stringArray = inputString.components(separatedBy: "\n")
//
//        var index = 0;
//
//        while index < stringArray.count {
//            lines.append(stringArray[index])
//            index += 1
//        }
//
//        print(lines)
//    }
    
    func parseMonth() {
        var _parsedDays: [String] = []
        let stringArray = inputString.components(separatedBy: "\n")
        
        var daysCount: Int = 0
        var currentDay: String = ""
        var index = 0
        var parsingDays = false // Flag to start parsing after the first day is detected

        while index < stringArray.count {
            let line = stringArray[index].trimmingCharacters(in: .whitespacesAndNewlines)
            
            // Check if the line starts with "OCT" followed by a number
            if line.starts(with: "OCT") {
                parsingDays = true // Start parsing from the first day onward
                
                // If we are already storing lines for a previous day, add it to _parsedDays
                if !currentDay.isEmpty {
                    _parsedDays.append(currentDay)
                    if let dayNumber = extractDay(from: line, withMonth: "OCT") {
                        let temp = ParseDay(day: dayNumber, month: "OCT", chunk: currentDay)
                        temp.getCycleDay()
                        _parsedDay.append(temp)
                        daysCount += 1
                        let day = Calendar.current.component(.day, from: Date())
                        // print(dayNumber)
                        // print(day)
                        if dayNumber == day && daysCount > 0 {
                            todayIndex = daysCount
//                            print(day)
//                            print(dayNumber)
                            // print("DAYS COUNT \(daysCount)")
                        }
                    }
                    
                    // let day = Calendar.current.component(.day, from: Date())
                    
                }
                
                // Start a new day with the current line
                currentDay = line + "\n"
            } else if parsingDays {
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
        
        // print(_parsedDays[10])
        // Now _parsedDays should only contain relevant day data
        var i = 0
//        while i < _parsedDays.count {
////            print(_parsedDays[i])
////            i += 1
//        }
        
     //   print("ran")
        let X = getCurrentCycleDay()
    //    print("after X")
    }
    
    func extractDay(from line: String, withMonth monthAbbreviation: String) -> Int? {
        let dayString = line.replacingOccurrences(of: monthAbbreviation, with: "")
        
        if let dayNumber = Int(dayString.prefix(while: { $0.isNumber })) {
            return dayNumber
        }
        return nil
    }
    
    func getCurrentCycleDay() -> Int {
        if todayIndex > 0 {
            let currentCycleDay = _parsedDay[todayIndex].getCycleDay()
            let currentCD = CycleDays.match(day: currentCycleDay)
            let periods = currentCD.getPeriods()
            _periods = periods
            print(_periods)
            return _parsedDay[todayIndex].getCycleDay()
            
        }
        return 0
    }
    
    func getPeriods() -> [String] {
        
        print (_periods)
        return _periods
    }
}
