//
//  PhoneBook.swift
//  SwiftDay06PM
//
//  Created by BEOMJOON KIM on 2025.02.05.
//

class PhoneBook {

    // 전화번호를 저장하는 배열
    // ["no":1, "name":"Kim", "phone":"010-1111-1111"]
    var seq: Int = 4
    var phoneBook: [[String:Any]] = [
        ["no":1, "name":"Kim", "phone":"010-1111-1111"],
        ["no":2, "name":"Lee", "phone":"010-1111-1112"],
        ["no":3, "name":"Park", "phone":"010-1111-1113"]
    ]

    // 집합 파라미터 형식으로 매개변수 선언
    func menu(_ menuItems: String...) -> Int {
        //print(menuItems.count)
        print("-------------- MENU ---------------")
        for (index, item) in menuItems.enumerated() {
            print("[\(index+1)]\(item)", terminator:" ")
        }
        print("\nChoice", terminator:": ")
        // readLine(): String을 정수로 형변환
        var no: Int = Int(readLine()!)!
        
        if no<1 || no>6 {
            print("입력 값 오류: 1~6 사이가 아닙니다. 다시 입력 하세요.")
            // 재귀 호출
            no = menu("INPUT","OUTPUT","SEARCH","MODIFY","DELEE","END")
        }
        return no
    }

    func inputSaram(){
        print("------ input 기능 ------")
        // 이름, 전화번호 입력 받기
        // 배열에 딕셔너리 형식으로 데이터 저장.
        // seq를 증가 시킨다.
        print("성명 입력", terminator:": ")
        let name = readLine()!
        print("전화 입력", terminator:": ")
        let phone = readLine()!
        phoneBook.append(["no":seq, "name":name, "phone":phone])
        seq += 1
    }

    func printSaram(_ index:Int, _ saram:[String:Any]) {
        print(index,"\t", String(describing: saram["no"] ?? ""), terminator:"\t")
        print( String(describing: saram["name"] ?? ""), terminator:"  \t")
        print( String(describing: saram["phone"] ?? ""), terminator:"\n")
    }

    func outputSaram() {
        print("------ output 기능 ------")
        print("i\tNo\tName\tPhone")
        for (index, saram) in phoneBook.enumerated() {
            printSaram(index, saram)
        }
    }

    var findIndex:Int = -1;
    func search() {
        print("------ search 기능 ------")
        print("성명 입력", terminator:": ")
        let name = readLine()!
        print("i\tNo\tName\tPhone")
        findIndex = -1
        for (index, saram) in phoneBook.enumerated() {
            if String(describing: saram["name"] ?? "") == name {
                findIndex = index
                printSaram(index, saram)
            }
        }
    }

    func modify(){
        //print("------ modify 기능 ------")
        search()  // 이름으로 검색 후 찾은 요소의 index를 findIndex 변수 저장.
        if findIndex != -1 {
            print("새 성명 입력", terminator:": ")
            let newName = readLine()!
            print("새 번호 입력", terminator:": ")
            let newPhone = readLine()!
            phoneBook[findIndex]["name"] = newName
            phoneBook[findIndex]["phone"] = newPhone
            print("수정 완료!")
        } else {
            print("검색 결과 없습니다!")
        }
    }

    func delete() {
        //print("------ delete 기능 ------")
        search()  // 이름으로 검색 후 찾은 요소의 index를 findIndex 변수 저장.
        if findIndex != -1 {
            phoneBook.remove(at: findIndex)
            print("삭제 완료!")
        } else {
            print("검색 결과 없습니다!")
        }
    }

    var _factory: [() -> Void] = []
    
    init() {
        _factory = [self.inputSaram, self.outputSaram, self.search, self.modify, self.delete]
    }
        
    func main() {
        print("::::: 전화 번호부 :::::")
        while true {
            let no: Int = menu("INPUT","OUTPUT","SEARCH","MODIFY","DELEE","END")
            if(no == 6) {
                break
            }
            _factory[no-1]()
        }
        
        print("----- 프로그램 종료 -----")
    }
}
