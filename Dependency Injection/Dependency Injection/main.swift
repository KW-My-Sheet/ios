//
//  main.swift
//  Dependency Injection
//
//  Created by 이주송 on 2022/09/13.
//

protocol Menu {
    func printCoffee()
    func printMeal()
}

import Foundation

class Eat: Menu {
    var coffee: String
    var meal: String
    
    init(coffee: String, meal: String) {
        self.coffee = coffee
        self.meal = meal
    } // 생성자를 활용하여 외부에서 의존성 주입
    
    func printCoffee() {
        print("Coffee : \(self.coffee)")
    }
    
    func printMeal() {
        print("Meal : \(self.meal)")
    }
}

let soey = Eat(coffee: "소이라데", meal: "피자")
let moooooni = Eat(coffee: "아샷추", meal: "쉑쉑버거")

print(soey.coffee)
print(soey.meal)
print(soey.printCoffee())
print(soey.printMeal())

print("-------------")

print(moooooni.coffee)
print(moooooni.meal)
print(moooooni.printCoffee())
print(moooooni.printMeal())
