import SwiftUI

/*
과거Swift 5.3 이하에서는 @ViewBuilder는 내부적으로 튜플 기반으로 뷰를 조합했으며, 튜플의 최대 길이 제한이 10개였기 때문에 10개를 초과할 경우 컴파일 에러가 발생했습니다. Swift 5.4 이상에서는 제한 없이 여러 개의 뷰를 사용해도 에러가 발생하지 않습니다.
 */

struct MaxCountViewEx: View {
    var body: some View {
        VStack {
            Text("뷰 1")
            Text("뷰 2")
            Text("뷰 3")
            Text("뷰 4")
            Text("뷰 5")
            Text("뷰 6")
            Text("뷰 7")
            Text("뷰 8")
            Text("뷰 9")
            Text("뷰 10")
            Text("뷰 11")  // ❌ 에러 발생 - Swift 5.4 이상에서는 무제한
        }
    }
}

#Preview {
    MaxCountViewEx()
}
