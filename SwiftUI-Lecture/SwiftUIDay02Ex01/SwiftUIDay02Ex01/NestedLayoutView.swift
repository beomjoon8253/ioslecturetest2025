//
//  NestedLayoutView.swift
//  SwiftUIDay02Ex01
//
//  Created by BEOMJOON KIM on 2025.02.11.
//

import SwiftUI

struct NestedLayoutView: View {
    var body: some View {
        VStack(spacing: 20) {  // 전체 레이아웃을 VStack으로 구성
            // HStack으로 "이름: 김범준" 텍스트 배치
            HStack {
                Text("이름:")
                    .font(.headline)
                Text("김범준")
                    .font(.body)
            }
            .padding()
            .background(Color.yellow.opacity(0.3))  // 배경색 확인을 위해 연한 노란색
            
            // ZStack으로 회색 배경에 텍스트 표시
            ZStack {
                Color.orange  // 회색 배경
                Text("중첩된 ZStack")
                    .foregroundColor(.white)  // 텍스트 색상을 흰색으로 설정
                    .font(.title)
            }
            .frame(height: 100)  // ZStack의 높이 지정
            .cornerRadius(10)  // 모서리를 둥글게 설정
        }
        .padding()
    }
}

#Preview {
    NestedLayoutView()
}
