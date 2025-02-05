//
//  PhoneBook.swift
//  SwiftDay06Proj
//
//  Created by BEOMJOON KIM on 2025.02.05.
//

class PhoneBook {
    let MENU_TITLE = "----- PHONE BOOK -----"
    let menuItems: [String] = ["INPUT", "OUTPUT", "SEARCH", "EDIT", "DELETE", "END"]
    var isDone: Bool = false
    
    var factory:[Any] = [Input(), Output(), Search(), Edit(), Delete(), End()]
        
    func paly() {
//        var no = menu(menuItems: menuItems)
//        if let input = factory[0] as? Input {
//            input.run()
//        }
        
        if no == 1 {
            input()
        }
        if no == 2 {
            output()
        }
        if no == 3 {
            search()
        }
        if no == 4 {
            edit()
        }
        if no == 5 {
            delete()
        }
        if no == 6 {
            end()
        }
    }
    
    func run() {
        while !isDone {
            paly()
        }
    }
    
    func menu(menuItems: [String]) -> Int {
        var no = 0
        repeat {
            print(MENU_TITLE);
            for (i, item) in menuItems.enumerated(){
                print("[\(i+1)]\(item)", terminator: " ")
            }
            print("\nChoice", terminator: ": ")
            no = Int(readLine() ?? "") ?? 0
        } while (no<1 || no>menuItems.count)
        
        return no
    }
}
