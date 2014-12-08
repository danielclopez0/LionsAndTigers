//
//  Lion.swift
//  LionsAndTigers
//
//  Created by Daniel Lopez on 11/29/14.
//  Copyright (c) 2014 Daniel Lopez. All rights reserved.
//

import Foundation
import UIKit

class Lion {
    var age = 0
    var isAlphaMale = false
    var image = UIImage(named: "")
    var name = ""
    var subspecies = ""
    
    func roar () {
        println("\(name): Roar Roar")
    }
    
    func randomFact () -> String {
        var randomFact: String
        
        if isAlphaMale {
            randomFact = "This is Boscoe, he is a really loud shark"
        }
        else {
            randomFact = "Female Lionesses form the stable social unit and do not tolerate outside females."
        }
        return randomFact
    }
}