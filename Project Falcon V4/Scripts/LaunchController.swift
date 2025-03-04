//
//  LaunchController.swift
//  Project Falcon V4
//
//  Created by Daniel Da Silva Mullane on 12/11/24.
//


import UIKit

class LaunchController: UIViewController {
    // Schedule ViewController
 
    //@IBOutlet weak var homecontroller : ViewController!
    @IBOutlet weak var progressbar: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.progressbar.setProgress(0.0, animated: false)
        
        //homecontroller.preload()
        
        let barTime = 5.0 // in Seconds
        
        for x in 0..<100{
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x) * barTime / 100.0) {
                self.progressbar.setProgress(Float(x)/100.0, animated: true)
                }
        }
        
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + barTime + 0.5) {
            self.performSegue(withIdentifier: "Transition", sender: self)
        }

        
    }
    
    
}
