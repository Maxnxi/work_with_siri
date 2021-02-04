//
//  DoubleTxt.swift
//  Work_with_Siri
//
//  Created by Maksim on 04.02.2021.
//

import Foundation

extension Double {
    func convertToClockTime() -> String {
        let minutes = Int(self)/60
        let seconds = Int(self) % 60
        return String(format: "%0d:%02d", minutes , seconds)
    }
}
