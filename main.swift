//
//  main.swift
//  HW1.1.3
//
//  Created by Евгений Малачлы on 24.12.2020.
//

import Foundation


// 1. Описать несколько структур – любой легковой автомобиль SportCar и любой грузовик TrunkCar.
// 2. Структуры должны содержать марку авто, год выпуска, объем багажника/кузова, запущен ли двигатель, открыты ли окна, заполненный объем багажника.
// 3. Описать перечисление с возможными действиями с автомобилем: запустить/заглушить двигатель, открыть/закрыть окна, погрузить/выгрузить из кузова/багажника груз определенного объема.
// 4. Добавить в структуры метод с одним аргументом типа перечисления, который будет менять свойства структуры в зависимости от действия.
// 5. Инициализировать несколько экземпляров структур. Применить к ним различные действия.
// 6. Вывести значения свойств экземпляров в консоль.


enum engineState {
    case start, stop
}

enum windowState {
    case open, close
}

enum trunkState {
    case full, empty
}

struct someCar {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "белый"
        case "black":
            self.color = "черный"
        case "red":
            self.color = "красный"
        case "blue":
            self.color = "синий"
        default:
            print("Ошибка ввода.")
        }
    }
    let release : Int
    var trunkVolume : Double {
        willSet {
            if (trunkState == .empty) && (trunkVolume > 0) && (trunkVolume != 0) && (newValue < trunkVolume) {
                let space = trunkVolume - newValue
                print ("\(brand) \(model) вместимость багажника: \(space)")
            } else { print("Ошибка ввода или \(brand) \(model) багажник полон.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand)\(model) зажигание включено")
            } else {print("\(brand) \(model) зажигание выключено")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand) \(model) окна открыты")
            } else { print("\(brand) \(model) окна закрыты") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand) \(model) багажник пуст")
    }
}

struct someTruck {
    let brand : String
    let model : String
    var color : String
    mutating func changeColor(c:String) {
        switch c {
        case "white":
            self.color = "белый"
        case "black":
            self.color = "черный"
        case "red":
            self.color = "красный"
        case "blue":
            self.color = "синий"
        default:
            print("Ошибка ввода.")
        }
    }
    let release : Int
    var bodyVolume : Double {
        willSet {
            if (trunkState == .empty) && (bodyVolume > 0) && (bodyVolume != 0) && (newValue < bodyVolume) {
                let space = bodyVolume - newValue
                print ("\(brand) \(model) вместимость багажника: \(space)")
            } else { print("Ошибка ввода или \(brand) \(model) багажник полон.")}
        }
    }
    var engineState : engineState {
        willSet {
            if newValue == .start {
                print ("\(brand) \(model) зажигание включено")
            } else {print("\(brand) \(model) зажигание выключено")}
        }
    }
    var windowState : windowState {
        willSet {
            if newValue == .open {
                print("\(brand)\(model) окна открыты")
            } else { print("\(brand) \(model) окна закрыты") }
        }
    }
    var trunkState : trunkState
    mutating func emptyTrunck() {
        self.trunkState = .empty
        print ("\(brand) \(model) багажник пуст")
    }
}

var car1 = someCar(brand: "Mercedes-Benz", model: "E200", color: "белый", release: 2020, trunkVolume: 520.0 , engineState: .stop, windowState: .open, trunkState: .empty)
var car2 = someCar(brand: "AUDI", model: "A8", color: "черный", release: 2020, trunkVolume: 410.0, engineState: .stop, windowState: .close, trunkState: .full)

var truck1 = someTruck(brand: "SCANIA", model: "G400", color: "синий", release: 2020, bodyVolume: 110000.0, engineState: .start, windowState: .open, trunkState: .full)
var truck2 = someTruck(brand: "MAN", model: "TGS", color: "красный", release: 2020, bodyVolume: 120000.0, engineState: .start, windowState: .close, trunkState: .empty)


car1.engineState = .start
car1.trunkVolume = 280.0
car1.changeColor(c: "красный")
car2.trunkVolume = 270.0
car2.emptyTrunck()
car2.trunkVolume = 84.7
car2.windowState = .open
car2.changeColor(c: "черный")

truck1.engineState = .stop
truck1.windowState = .close
truck2.engineState = .stop
truck2.bodyVolume = 3425845


print ("Информация по первому автомобилю: Марка и модель авто: \(car1.brand), вместимость багажника: \(car1.trunkVolume), зажигание: \(car1.engineState)")




