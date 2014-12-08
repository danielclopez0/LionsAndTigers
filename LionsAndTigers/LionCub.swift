//
//  LionCub.swift
//  LionsAndTigers
//
//  Created by Daniel Lopez on 12/7/14.
//  Copyright (c) 2014 Daniel Lopez. All rights reserved.
//

import Foundation

class LionCub: Lion {
    func rubLionCubsBelly () {
        println("Cub: Snuggle and be happy")
    }
    
    override func roar() {
        
        super.roar()
        
        println("Cub: growl growl")
    }
    
    override func randomFact() -> String {
        var randomFactString: String
        
        if isAlphaMale {
            randomFactString = "Cubs are usually hidden in the dense bush for approximately six weeks."
        }
        else {
            randomFactString = "Cubs begin eating meat at about the age of six weeks"
        }
        return randomFactString
    }
    
    
}