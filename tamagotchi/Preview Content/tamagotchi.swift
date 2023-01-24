//
//  tamagotchi.swift
//  tamagotchi
//
//  Created by Luk'yanov, Mikhail (JMOB) on 24/01/2023.
//

import Foundation

struct Tamagotchi {
    let name: String
    var age: Int
    var hunger: Int
    var weight: Float
    var needForToilet: Int
    var health: Int
    var happiness: Int
    var discipline: Int
    
    mutating func giveMedicine() {
        self.health += 1
    }
    
    mutating func disciplineTamagotchi() {
        self.discipline += 1
    }
    
    mutating func feed() {
        self.hunger += 1
        self.weight += 1
    }
    
    mutating func goToilet() {
        self.needForToilet -= 7
    }
    
    func displayStats() -> String {
        
        return "Name: \(self.name)\nAge: \(self.age)\nHealth: \(self.health)\nHunger: \(self.hunger)\nWeight: \(self.weight)\nNeed For Toilet: \(self.needForToilet)\nHappiness: \(self.happiness)\nDiscipline: \(self.discipline)"
    }
    
}
