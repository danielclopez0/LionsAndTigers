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
    var myLions:[Lion] = []
    var myLionCubs: [LionCub] = []
    
    var currentIndex = 0
    
    var currentAnimal = (species: "Tiger",index: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var myTiger = Tiger()
        myTiger.name = "Roscoe"
        myTiger.breed = "Lab Tiger"
        myTiger.age = 4
        myTiger.image = UIImage(named: "Roscoe.jpg")
        
        myTiger.age = myTiger.ageInTigerYearsFromAge()
                
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

        
//        start lions here
        var lion = Lion()
        lion.age = 4
        lion.isAlphaMale = true
        lion.image = UIImage(named: "Roscoe.jpg")
        lion.name = "Boscoe"
        lion.subspecies = "Labrador Lion"
        
        var lioness = Lion()
        lioness.age = 3
        lioness.isAlphaMale = false
        lioness.image = UIImage(named: "Lioness.jpeg")
        lioness.name = "Sarabi"
        lioness.subspecies = "Barbary"
        
        self.myLions += [lion,lioness]
        
        lion.roar()
        lioness.roar()
        
//        start lion cubs here
        var lionCub = LionCub()
        lionCub.age = 1
        lionCub.name = "Simba"
        lionCub.image = UIImage(named: "LionCub1.jpg")
        lionCub.subspecies = "Masai"
        lionCub.isAlphaMale = true
        
        var femaleLionCub = LionCub()
        femaleLionCub.age = 1
        femaleLionCub.name = "Nala"
        femaleLionCub.image = UIImage(named: "LionCub2.jpeg")
        femaleLionCub.subspecies = "Transvaal"
        femaleLionCub.isAlphaMale = false
        
        self.myLionCubs += [lionCub, femaleLionCub]
        
        lionCub.roar()
        lionCub.rubLionCubsBelly()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func nextBarButtonItemPressed(sender: UIBarButtonItem) {
        updateAnimal()
        updateView()

    }
    
    func updateAnimal () {
        switch currentAnimal {
        case ("Tiger", _):
            let randomIndex = Int(arc4random_uniform(UInt32(myLions.count)))
            currentAnimal = ("Lion", randomIndex)
        case ("Lion", _):
            let randomIndex = Int(arc4random_uniform(UInt32(myLionCubs.count)))
            currentAnimal = ("Lion Cub", randomIndex)
        default:
            let randomIndex = Int(arc4random_uniform(UInt32(myTigers.count)))
            currentAnimal = ("Tiger", randomIndex)
        }
    }
    
    func updateView () {
        
        UIView.transitionWithView(self.view, duration: 1, options: UIViewAnimationOptions.TransitionCrossDissolve, animations: {
            
//            if self.currentAnimal.species == "Tiger" {
//                let tiger = self.myTigers[self.currentAnimal.index]
//                self.myImageView.image = tiger.image
//                self.breedLabel.text = tiger.breed
//                self.nameLabel.text = tiger.name
//                self.ageLabel.text = "\(tiger.age)"
//                self.randomFactLabel.text = tiger.randomFact()
//                
//            } else if self.currentAnimal.species == "Lion" {
//                let lion = self.myLions[self.currentAnimal.index]
//                self.myImageView.image = lion.image
//                self.nameLabel.text = lion.name
//                self.ageLabel.text = "\(lion.age)"
//                self.breedLabel.text = lion.subspecies
//                self.randomFactLabel.text = lion.randomFact()
//                
//            }
            
            switch self.currentAnimal.species {
            case ("Tiger"):
                let tiger = self.myTigers[self.currentAnimal.index]
                self.myImageView.image = tiger.image
                self.breedLabel.text = tiger.breed
                self.nameLabel.text = tiger.name
                self.ageLabel.text = "\(tiger.age)"
                self.randomFactLabel.text = tiger.randomFact()
                
            case ("Lion"):
                let lion = self.myLions[self.currentAnimal.index]
                self.myImageView.image = lion.image
                self.nameLabel.text = lion.name
                self.ageLabel.text = "\(lion.age)"
                self.breedLabel.text = lion.subspecies
                self.randomFactLabel.text = lion.randomFact()
                
            default:
                let lionCub = self.myLionCubs[self.currentAnimal.index]
                self.myImageView.image = lionCub.image
                self.nameLabel.text = lionCub.name
                self.ageLabel.text = "\(lionCub.age)"
                self.breedLabel.text = lionCub.subspecies
                self.randomFactLabel.text = lionCub.randomFact()
            }
            
            }, completion: {
                (finished: Bool)-> () in
        })
    }

}

