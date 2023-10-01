//
//  ViewController.swift
//  ExMeasurementFormatter
//
//  Created by 김종권 on 2023/09/29.
//

import UIKit
import Foundation

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sample()
    }
    
    func sample() {
        // m를 나타내는 Measurement 객체를 생성 & cm단위로 변환
        let lengthInMeters = Measurement(value: 5, unit: UnitLength.meters)
        let lengthInCentimeters = lengthInMeters.converted(to: .centimeters)
        
        // MeasurementFormatter를 사용하여 길이를 문자열로 포멧팅
        let formatter = MeasurementFormatter()
        formatter.unitOptions = .providedUnit
        formatter.numberFormatter.maximumFractionDigits = 2
        
        let formattedLength = formatter.string(from: lengthInCentimeters)
        print("길이: " + formattedLength) // 길이: 500 cm
    }
}
