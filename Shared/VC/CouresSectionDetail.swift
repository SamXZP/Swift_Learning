//
//  CouresSectionDetail.swift
//  SwiftUI_Learning
//
//  Created by Sam on 2021/5/17.
//

import SwiftUI

struct CouresSectionDetail: View {
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            ScrollView{
                CourseItem(cornerRadius: 0)
                    .frame(height:300)
                VStack {
                    Text("《You Have Only One Life》 There are moments in life when you miss someone so much that you just want to pick them from your dreams and hug them for real!")
                    
                    Text("You Have Only One Life").font(.title).bold()
                    
                    Text(" May you have enough happiness to make you sweet,enough trials to make you strong,enough sorrow to keep you human,enough hope to make you happy")
                    Text("Always put yourself in others’shoes").font(.title).bold()
                    Text(" If you feel that it hurts you,it probably hurts the other person, too.")
                }
                .padding()
            }
            CloseButton()
                .padding()
                .onTapGesture {
                    presentationMode.wrappedValue.dismiss()
                }
        }
    }
}

struct CouresSectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        CouresSectionDetail()
    }
}
