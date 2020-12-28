//
//  ContentView.swift
//  GuitarChords
//
//  Created by Volodymyr Rykhva on 21.12.2020.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationView {
                ChordsLibraryView()
                    .navigationBarTitle(
                        Text("Chords library"), displayMode: .inline
                    )
            }.tabItem {
                Image("library").renderingMode(.template)
                Text("Chords library").font(.headline)
            }
            NavigationView {
                MakeSequenceView()
                    .navigationBarTitle(
                        Text("Make sequence"), displayMode: .inline
                    )
            }.tabItem {
                Image("make").renderingMode(.template)
                Text("Make sequence")
                    .font(.custom("Lato-Regular", size: 18))
            }
            NavigationView {
                YourSequencesView()
                    .navigationBarTitle(
                        Text("Your sequences"), displayMode: .inline
                    )
            }.tabItem {
                Image("user").renderingMode(.template)
                Text("Your sequences")
                    .font(.custom("Lato-Regular", size: 18))
            }
        }.accentColor(Color("Blue2"))
    }
}

struct AppView: View {
    init() {
        setupLayout()
    }
    var body: some View {
        TabBarView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            AppView()
        }
    }
}

extension AppView {
    func setupLayout() {
        UITabBar.appearance().barTintColor = UIColor(named: "Background")
        UINavigationBar.appearance().barTintColor = UIColor(named: "Background")
        UINavigationBar.appearance().tintColor = UIColor(named: "Background")
        UINavigationBar.appearance().titleTextAttributes = [
            NSAttributedString.Key.foregroundColor : UIColor(named: "InactiveText") ?? .white,
            NSAttributedString.Key.font:
                UIFont(name: "Lato-Regular", size: 18) ?? UIFont.systemFont(ofSize: 18)
        ]
    }
}
