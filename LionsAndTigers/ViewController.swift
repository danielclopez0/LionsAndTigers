//
//  ViewController.swift
//  LionsAndTigers
//
//  Created by Daniel Lopez on 11/16/14.
//  Copyright (c) 2014 Daniel Lopez. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var breedLabel: UILabel!
    @IBOutlet weak var randomFactLabel: UILabel!
    
    var myTigers:[Tiger] = []
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Roscoe"
        myTiger.breed = "Lab"
        myTiger.age = 4
        myTiger.image = UIImage(named: "Roscoe.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge()
        
//        myTiger.chuff()
        
        myTigers.append(myTiger)
        
        myImageView.image = myTigers[0].image
        nameLabel.text = myTigers[0].name
        ageLabel.text = "\(myTigers[0].age)"
        breedLabel.text = myTigers[0].breed
        randomFactLabel.text = myTigers[0].randomFact()
        
        var secondTiger = Tiger()
        secondTiger.name = "Tigress"
        secondTiger.breed = "Indochinese Tiger"
        secondTiger.age = 2
        secondTiger.image = UIImage(named: "IndochineseTiger.jpg")
        
        var thirdTiger = Tiger()
        thirdTiger.name = "Jacob"
        thirdTiger.breed = "Malayan Tiger"
        thirdTiger.age = 4
        thirdTiger.image = UIImage(named: "MalayanTiger.jpg")
        
        var fourthTiger = Tiger()
        fourthTiger.name = "Spar"
        fourthTiger.breed = "Siberian Tiger"
        fourthTiger.age = 5
        fourthTiger.image = UIImage(named: "SiberianTiger.jpg")
        
        myTigers += [secondTiger,thirdTiger,fourthTiger]

        println("My tiger's name is \(myTiger.name), its' age is \(myTiger.age), its breed is \(myTiger.breed) and its' image is \(myTiger.image)")
        
        myTiger.chuffANumberOfTimes(3, isLoud: false)        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        
        
        var randomIndex: Int
        
        do {
            randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
        } while currentIndex == randomIndex
        
        currentIndex = randomIndex
        
        let tiger = myTigers[randomIndex]
        
//        myImageView.image = tiger.image
//        nameLabel.text = tiger.name
//        ageLabel.text = "\(tiger.age)"
//        breedLabel.text = tiger.breed
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
            self.myImageView.image = tiger.image
            self.nameLabel.text = tiger.name
            self.ageLabel.text = "\(tiger.ageInTigerYearsFromAge())"
            self.breedLabel.text = tiger.breed
            self.randomFactLabel.text = tiger.randomFact()
            
            }, completion: {
                (finished: Bool)-> () in
        })
    }

}

