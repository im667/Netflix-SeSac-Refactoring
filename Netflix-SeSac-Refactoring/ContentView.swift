//
//  ContentView.swift
//  Netflix-SeSac-Refactoring
//
//  Created by mac on 2022/05/09.
//

import SwiftUI

struct ContentView: View {
    
    let titles = ["Nexflix Sample App"]
    
    var body: some View {
        NavigationView {
            List(titles, id: \.self) {
                let netflixVC = MainViewControllerRepresentable()
                    .navigationBarHidden(true)
                    .edgesIgnoringSafeArea(.all)
                NavigationLink($0, destination: netflixVC)
            }
            .navigationTitle("Swift to UIkit")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
