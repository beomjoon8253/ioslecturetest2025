//  Created by BEOMJOON KIM on 2025.02.03.

/*
// 각 월의 날짜수를 저장한 배열.
let monthDays: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
//               index  0   1   2   3   4   5   6   7   8   9   10  11
//               month  1   2   3   4   5   6   7   8   9   10  11  12
var month: Int = 0
var days: Int = 0
var total: Int = 0

// 날짜 수를 알고자 하는 달 입력: 2
// 결과 2월은 28일까지 있다.
print("날짜 수를 알고자 하는 달 입력: ", terminator: "")
month = Int(readLine() ?? "") ?? 0
days = monthDays[month - 1]
print("결과 \(month)월은 \(days)일까지 있다.")

// 중요: 1) 반복해서 구현 해보기, 2) 머리를 믿지말고 그림을 그리기
// 생각이 바뀌면 행동이 바뀌고
// 행동이 반복되면 습관이 된다.
// 습관이 바뀌면 운명이 바뀐다.

// monthDays를 이용해서 "1년은 365일까지 있다"는것을 출력
// total변수에 monthDays의 모든 요소를 for in으로 누적
//var cnt = 1
// 인덱스와 요소를 같이 뽑아 온다.
// cnt = cnt + 1   <--- cnt += 1
/*
for (i, day) in monthDays.enumerated() {
    print("monthDays[\(i)] = \(day)")
}
*/

total = 0
for i in 0..<monthDays.count {
    total += monthDays[i]
    print(i, i+1, monthDays[i], total)
}
*/


// 문제1) 특정 월,일을 입력 받아서 1월1일부터 입력 된 월,일까지의 누적 날짜 수 출력. (난이도: 중)
// 예)
// 월 입력: 4
// 일 입력: 10
// 1월 1일부터 4월 10일까지의 누적일은 100일입니다.

// 각 월의 날짜수를 저장한 배열.
//let monthDays: [Int] = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31]
////               index  0   1   2   3   4   5   6   7   8   9   10  11
////               month  1   2   3   4   5   6   7   8   9   10  11  12
//var month: Int = 0
//var day: Int = 0
//var total: Int = 0
//var num = 0
//
//// 작업 순서 (의사 코드)
//// 1. 월과 일을 입력 받아서 저장한다.
//// 1-1. 월은 month, 일은 day에 저장.
//// 2. total 변수에 mothDays의 요소값 누적.
//// 2-1. 인덱스가 month - 1보다 작을 때까지 누적하기 (0..<month-1)
//// 3. total에 입력 momth의 day이를 추가.
//
//print("월 입력:", terminator: " ")
//month = Int(readLine() ?? "") ?? 0
//print("일 입력:", terminator: " ")
//day = Int(readLine() ?? "") ?? 0
//
//print("입력 된 날짜는 \(month)월 \(day)일입니다.")

/*
total = 0 // 누적되는 변수는 초기화 필수.
for i in 0..<month-1 {
    total += monthDays[i]
}
// print(total) // 90
 */

/*
var idx = 0
while idx < month - 1 {
    total += monthDays[idx]
    idx += 1
}

total += day // total = total + day
print("1월 1일부터 \(month)월 \(day)일까지의 누적일은 \(total)일입니다.")
*/

/*
// 수열 문제
// 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10 = 55
total = 0
num = 1
let END = 10
while num <= END {
    // 중복해서 사용하는 데이터는 상수로 만들어서 사용.
    print(num, terminator: num < END ? "+" : "=")
    // total에 누적하고 num 증가
    total += num
    num += 1
}
print(total)
*/

/*
// 제한 시간 5분
// 1 - 2 + 3 - 4 + 5 - 6 + 7 - 8 + 9 - 10 = -5
total = 0
num = 1
let END = 10
while num <= END {
    if num % 2 == 1 {
        print(num, terminator: num < END ? "-" : "=")
        total += num
    } else {
        print(num, terminator: num < END ? "+" : "=")
        total -= num
    }
    print("total: \(total)")
    num += 1
}
print(total)
*/


// 과제: Weekly Project는 다음 Project 전까지 계속 진행.
// 기본과제: 배운것 TIL 정리 ( 배운것 + 알파)
// 퀴즈: 피보나치 수열 출력, 피보나치 수열에 부호 엇갈라서.
/*
// 1 + 1 + 2 + 3 + 5 + 8 + 13 + 21 = 54?
let MAX = 21
var prev = 0
var cur = 1
var next = 1
var flag = false
total = 0
while cur <= MAX {
    // cur 출력
    print(cur, terminator: cur == MAX ? "=" : "+")
    total += cur
    // 이전항과 현재항을 더해서 다음 항 만든
    // 현재항은 이전항으로 변경
    // 다음항이 현재항으로 치환 된다.
    next = prev + cur
    prev = cur // 덮어 지기 때문에 미리 이전항으로 치환 해 주어야 한다.
    cur = next
}
print(total)
 */

/*
// 1 + 1 - 2 + 3 - 5 + 8 - 13 + 21 = 14?
let MAX = 21
var prev = 0
var cur = 1
var next = 1
var flag = true
total = 2
while cur <= MAX {
    // 더하기 빼기가 교차 되도록
    if flag {
        print(cur, terminator: cur == MAX ? "=" : "+")
        total -= cur
    } else {
        print(cur, terminator: cur == MAX ? "=" : "-")
        total += cur
    }
    flag = !flag
    
    next = prev + cur
    prev = cur
    cur = next
}
print(total)
*/

 
// 내일은 Swift 문법 컬렉션, 함수 진도 나갑니다.


// 중요: 김춘수 "꽃"
// 함수나 구조체는 호출하지 않으면 생성되거나 동작 하지 않는다.
// 불러 줘야 한다!

// 구조체 객체를 생성하고 멤버 호출
// 생성자 함수 호출
// exam은 참조변수 (스택 메모리 영역)
// Example() 생성자 함수를 호출하면 Example의 객체가 힙 메모리 공간에 생성 된다.
let exam = Example()
exam.run() // 멤버 메서드 호출(실행)
