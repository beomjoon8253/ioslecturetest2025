//  FunctionEx03.swift
//  SwiftDay06

struct FunctionEx03 {
    
    init() {
        // 객체(인스턴스)를 생성하면 바로 실행한다.
        // 멤버를 초기화 시키는 용도
        print("FunctionEx03 init 실행")
        
        // 옵셔널을 반환 하는 함수 호출
        if let result = getName() {
            print("\(result)님 안녕하세요!")
        } else {
            print("값이 유효하지 않습니다")
        }
    }
}

extension FunctionEx03 {
    // 옵셔널을 반환 하는 함수 선언
    func getName() -> String? {
        return "HONG"
    }
}
