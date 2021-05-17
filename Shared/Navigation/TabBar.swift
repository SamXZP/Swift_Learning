//
//  TabBar.swift
//  SwiftUI_Learning (iOS)
//
//  Created by Sam on 2021/5/17.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView{
            NavigationView{
                CoursesView()
            }.tabItem {
                Image(systemName: "book.closed")
                Text("sider")
            }
            
            NavigationView{
                CourseList()
            }.tabItem {
                Image(systemName: "list.bullet.rectangle")
                Text("Tutorials")
            }
            
            NavigationView{
                CourseList()
            }.tabItem {
                Image(systemName: "tv")
                Text("Livestreams")
            }
            
            
            NavigationView{
                CourseList()
            }.tabItem {
                Image(systemName: "mail.stack")
                Text("Certificates")
            }
            
            NavigationView{
                Sidebar()
            }.tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
        }
    }
}


struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
