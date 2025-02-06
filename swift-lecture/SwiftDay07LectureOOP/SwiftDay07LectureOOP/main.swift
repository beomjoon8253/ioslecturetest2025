//  main.swift
//  SwiftDay07LectureOOP

import Foundation

// 객체를 생성하고 멤버함수 호출
let sonata: Car = Car(color: "검정색", speed: 110)
let grandeur = Car(color: "하얀색", speed: 120)

// 리스트에 넣을 수 있나?
let carList: [Car] = [sonata, grandeur]
let carList2: [Car] = [Car(color: "보라색", speed: 90), Car(color: "파란색", speed: 130)]

//sonata.drive()
//grandeur.drive()
for car in carList {
    car.drive()
}

for (i, car) in carList2.enumerated() {
    print(i, terminator: ": ")
    car.drive()
}
