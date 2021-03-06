//
//  CoursesView.swift
//  Shared
//
//  Created by Sam on 2021/5/13.
//

import SwiftUI

struct CoursesView: View {
    @State var show = false
    @Namespace var namespace
    @State var selectedItem: Course? = nil
    @State var isDisabled = false
    var body: some View {
        ZStack {
            #if os(iOS)
            topcontent
                .navigationBarHidden(true)
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #else
            topcontent
            fullContent
                .background(VisualEffectBlur().edgesIgnoringSafeArea(.all))
            #endif
        }
        .navigationTitle("Courses")
    }
    
    var topcontent: some View {
        ScrollView {
            VStack(spacing:0) {
                Text("Course")
                    .font(.largeTitle)
                    .bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,16)
                    .padding(.top,54)
                
                LazyVGrid(
                    columns: [GridItem(.adaptive(minimum: 160), spacing: 16)],
                    spacing: 16
                ) {
                    ForEach(courses) { item in
                        VStack {
                            CourseItem(course: item)
                                .matchedGeometryEffect(id: item.id, in: namespace, isSource: !show)
                                .frame(height: 200)
                                .onTapGesture {
                                    withAnimation(.spring(response: 0.5, dampingFraction: 0.7, blendDuration: 0)) {
                                        show.toggle()
                                        selectedItem = item
                                        isDisabled = true
                                    }
                                }
                                .disabled(isDisabled)
                        }
                        .matchedGeometryEffect(id: "container\(item.id)", in: namespace, isSource: !show)
                    }
                }
                .padding(16)
                .frame(maxWidth: .infinity)
                
                
                Text("Least Sections")
                    .font(.subheadline)
                    .bold()
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.leading,16)
                
                LazyVGrid(columns: [GridItem(.adaptive(minimum:240))]) {
                    ForEach(courseSections) { item in
                        CourseRow(item: item)
                    }
                }.padding()
                
                
            }
        }
        .zIndex(1)
    }
    
    @ViewBuilder
    var fullContent: some View {
        if selectedItem != nil {
            ZStack(alignment: .topTrailing) {
                CourseDetail(course: selectedItem!, namespace: namespace)
                CloseButton(image: "multiply.circle")
                    .padding(16)
                    .onTapGesture {
                        withAnimation(.spring()) {
                            show.toggle()
                            selectedItem = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                isDisabled = false
                            }
                        }
                    }
            }
            .zIndex(2)
            .frame(maxWidth: 712)
            .frame(maxWidth: .infinity)
            
        }
    }
}

struct CoursesView_Previews: PreviewProvider {
    static var previews: some View {
        CoursesView()
    }
}
