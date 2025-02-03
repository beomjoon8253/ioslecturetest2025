//
//  Test.swift
//  SwiftDay04Homework
//
//  Created by BEOMJOON KIM on 2025.02.03.
//

struct Test {
    func run() {
        var arr: [Any] = [1, "Hello", true, 3.14]

        for (i, v) in arr.enumerated() {
            print(i, v)
        }


        var arr2: [String] = Array(repeating: "", count: 5)
        // arr2 = ["", "", "", "", ""]

        arr2[0] = "Hello"
        arr2[1] = "World"

        arr2.append(contentsOf: ["Swift", "Codable"])
        // ["Hello", "World", "", "", "", "Swift", "Codable"]

        print(arr2)
    }
}
