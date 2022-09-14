//
//  main.swift
//  Dependency Injection
//
//  Created by 이주송 on 2022/09/13.
//
import Foundation

// MARK: - 의존성 주입

protocol Menu {
    func printCoffee()
    func printMeal()
} // 1. 의존성 주입을 위한 '추상적인' 객체(Protocol)

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
} // 2. Eat 클래스는 Menu Protocol을 채택하여 Protocol에 정의된 함수를 '실체화' 시켜준다.

let menu = Eat(coffee: "소이라떼", meal: "피자")
let otherMenu = Eat(coffee: "아샷추", meal: "쉑쉑버거")

// menu와 otherMenu는 Eat의 변화에 의존하게 됨 -> ex) Eat안에 printCoffee가 달라지면 menu.printCoffee가 달라짐


// MARK: - 의존 관계 역전 법칙

struct Person {
    var todayEat: Menu
    
    func printCoffee() {
        todayEat.printCoffee()
    }
    
    func printMeal() {
        todayEat.printMeal()
    }
    
    mutating func changeMenu(menu: Menu) {
        self.todayEat = menu
    } /* MARK: changeMenu를 이용하여 외부에서 의존성 주입 -> 같은 Protocol을 채택하지만, Eat 객체와 Person 객체는 독립적인 객체가 된다 !
         MARK: Eat 객체를 수정한다고해서 Person객체를 수정해야하는 문제 방지 */
}

var soey = Person(todayEat: menu)

soey.printCoffee()
soey.changeMenu(menu: otherMenu)
soey.printCoffee()
