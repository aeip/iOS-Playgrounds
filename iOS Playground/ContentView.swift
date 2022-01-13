//
//  ContentView.swift
//  iOS Playground
//
//  Created by Marcupio on 1/10/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Login Register", destination: LoginRegister())
                NavigationLink("Profile", destination: Profile())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
