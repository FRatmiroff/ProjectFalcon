//
//  LaunchController.swift
//  Project Falcon V4
//
//  Created by Daniel Da Silva Mullane on 12/11/24.
//


import UIKit

class LaunchController: UIViewController {
    // Schedule ViewController
 
    // @IBOutlet weak var progressBar:  {Progress View}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            self.performSegue(withIdentifier: "Transition", sender: self)
        }
    }
    
    
}
