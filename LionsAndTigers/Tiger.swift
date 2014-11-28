//
//  Tiger.swift
//  LionsAndTigers
//
//  Created by Daniel Lopez on 11/16/14.
//  Copyright (c) 2014 Daniel Lopez. All rights reserved.
//

import Foundation
import UIKit

struct Tiger {
    var age = 0
    var name = ""
    var breed = ""
    var image = UIImage(named: "")
    
    func chuff() {
        println("Tiger: chuff chuff, I am \(name)!")
    }
    
    func chuffANumberOfTimes (numberOfTimes: Int) {
        for var chuff = 0; chuff < numberOfTimes; ++chuff {
            self.chuff()
        }
    }
    
    func chuffANumberOfTimes (numberOfTimes: Int, isLoud: Bool) {
        for var chuffTimes = 1; chuffTimes <= numberOfTimes; chuffTimes++ {
            if isLoud {
                chuff()
            } else {
                println("Tiger: purr purr, I am \(age)!")
            }
        }
    }
    
    func ageInTigerYearsFromAge() -> Int{
        return age * 3
    }
}