//
//  CycleDays.swift
//  Project Falcon V4
//
//  Created by Dominic Durso on 10/2/24.
//

enum CycleDays{
    
    case CD1(day: Int, periods: [String])
    case CD2(day: Int, periods: [String])
    case CD3(day: Int, periods: [String])
    case CD4(day: Int, periods: [String])
    case CD5(day: Int, periods: [String])
    case CD6(day: Int, periods: [String])
    case CD7(day: Int, periods: [String])
    case NOCD
    
    func getCycleDay() -> Int{
        switch self {
        case .CD1: return 1
        case .CD2: return 2
        case .CD3: return 3
        case .CD4: return 4
        case .CD5: return 5
        case .CD6: return 6
        case .CD7: return 7
        case .NOCD: return 0
        }
    }
    
    func getPeriods() -> [String] {
        switch self {
        case .CD1: return ["A", "B", "C", "D", "E"]
        case .CD2: return ["F", "G", "A", "B", "C"]
        case .CD3: return ["D", "E", "F", "G", "A"]
        case .CD4: return ["B", "C", "D", "E", "F"]
        case .CD5: return ["G", "A", "B", "C", "D"]
        case .CD6: return ["E", "F", "G", "A", "B"]
        case .CD7: return ["C", "D", "E", "F", "G"]
        case .NOCD: return []
        }
    }
}
