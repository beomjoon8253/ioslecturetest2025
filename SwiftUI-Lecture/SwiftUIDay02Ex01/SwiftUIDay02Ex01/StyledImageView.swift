//
//  StyledImageView.swift
//  SwiftUIDay02Ex01
//
//  Created by BEOMJOON KIM on 2025.02.11.
//

import SwiftUI

struct StyledImageView: View {
    var body: some View {
        Image("img01")
            .resizable()
            .scaledToFit()
            .frame(width: 200)
            .clipShape(Circle())
            .padding(10)
    }
}
// 바람을 읽어야 하는데 파도만 봤다. (관상)

// 이전 버전 호환 가능 프로바이더
struct StyledImageView_Previews: PreviewProvider {
    static var previews: some View {
        StyledImageView()
    }
}
