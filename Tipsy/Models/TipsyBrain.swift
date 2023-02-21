//
//  TipsyBrain.swift
//  Tipsy
//
//  Created by Ildar Garifullin on 21/02/2023.
//

import Foundation

struct TipsyBrain {
    
    var tipsy: Double = 0
   
    func getValue() -> String {
        let tipsyString = String(format: "%.2f", tipsy)
        
        return tipsyString
    }
    
    mutating func calculateTipsy(textFieldValue: Double, percentValue: Double, stepperValue: Double) {
        tipsy = (textFieldValue + (textFieldValue * percentValue)) / stepperValue
    }
}
