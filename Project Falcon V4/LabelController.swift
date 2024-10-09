//
//  LabelController.swift
//  Project Falcon V4
//
//  Created by Dominic Durso on 10/7/24.
//
import UIKit
class LabelController: ViewController {

    
    
    @IBOutlet weak var lab: UILabel!
    @IBOutlet weak var descLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        updateScheduleLabel()
        
    }
    
    
    
    // Function to update the label text based on the day of the week
    func updateScheduleLabel() {
        
        // Get the current day of the week (Sunday = 1, Monday = 2, ..., Saturday = 7)
        let calendar = Calendar.current
        let weekday = calendar.component(.weekday, from: Date())
        
        // DateFormatter to get abbreviated day and current date
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "E, MMM d" // Format: "Mon, Oct 3"
            let currentDate = dateFormatter.string(from: Date())
            
            // Update the date label
            dateLabel.text = currentDate
        
        // Determine the schedule based on the day of the week
        switch weekday {
        case 2, 3, 6: // Monday (2), Tuesday (3), Friday (6)
            lab.text = "Normal Schedule"
        case 5: // Thursday (5)
            lab.text = "Dress Uniform Schedule"
            descLabel.text = "- No Advisory"
        case 4: // Wednesday (4)
            lab.text = "Late Start Schedule"
            descLabel.text = "- No Advisory\n- No Flex"
        default:
            lab.text = "No Schedule Available"
        }
        
        
        
        
    }
}
