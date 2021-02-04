//
//  WorkOutVC.swift
//  Work_with_Siri
//
//  Created by Maksim on 02.02.2021.
//

import UIKit
import Intents

class WorkOutVC: UIViewController {

    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var timerLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        typeLbl.isHidden = true
        timerLbl.isHidden = true
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleSiriRequest), name: NSNotification.Name("workoutStartNotification"), object: nil)
        
        INPreferences.requestSiriAuthorization { (status) in
            if status == INSiriAuthorizationStatus.authorized{
                print("SiriKit: Authorized")
            } else {
                print("SiriKit: Unauthorized")
            }
        }
    }
    
    @objc func handleSiriRequest() {
        guard let intent = DataService.instance.startWorkoutIntent, let goalValue = intent.goalValue, let workoutType = intent.workoutName?.spokenPhrase else {
            timerLbl.isHidden = true
            typeLbl.isHidden = true
            return
        }
        typeLbl.isHidden = false
        timerLbl.isHidden = false
        
        typeLbl.text = "TYPE: \(workoutType.capitalized)" //.capitalized
        timerLbl.text = "\(goalValue.convertToClockTime()) Left"
        
        
    }
    
   

}

