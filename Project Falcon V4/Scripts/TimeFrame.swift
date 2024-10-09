//
//  TimeFrame.swift
//  Project Falcon V4
//
//  Created by Dominic Durso on 10/2/24.
//

enum TimeFrame{
    
    case MON(type: String, times: [Int])
    case TUES(type: String, times: [Int])
    case WED(type: String, times: [Int])
    case THURS(type: String, times: [Int])
    case FRI(type: String, times: [Int])
    
    
    func getDayType() -> String{
        switch self {
        case .MON: return "Normal Schedule"
        case .TUES: return "Normal Schedule"
        case .WED: return "Late Start Schedule"
        case .THURS: return "Dress Uniform Schedule"
        case .FRI: return "Normal Schedule"
            
        }
    }

    
    
    
    
}
