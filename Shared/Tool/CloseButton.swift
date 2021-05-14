//
//  CloseButton.swift
//  Shared
//
//  Created by Sam on 2021/5/13.
//

import SwiftUI

struct CloseButton: View {
    var image:String = "xmark"
    var body: some View {
        Image(systemName: image)
            .font(.system(size: 17, weight: .bold))
            .padding(.all,10)
            .background(Color.black.opacity(0.6))
            .foregroundColor(.white)
            .clipShape(Circle())
    }
}

struct CloseButton_Previews: PreviewProvider {
    static var previews: some View {
        CloseButton()
    }
}
