//
//  ContentView.swift
//  GuitarChords
//
//  Created by Volodymyr Rykhva on 21.12.2020.
//

import SwiftUI

struct AppView: View {
    init() {
        setupLayout()
    }
    var body: some View {
        TabBarView()
    }
}

// MARK: - Private

private struct NavigationViewWithRootView<Content: View>: View {
    let content: Content
    let title: String
    let image: String

    init(image: String, title: String, @ViewBuilder content: () -> Content) {
        self.content = content()
        self.title = title
        self.image = image
    }

    var body: some View {
        NavigationView {
            content.navigationBarTitle(Text(title), displayMode: .inline)
        }.tabItem { makeTabItem(image: image, title: title) }
    }

    private func makeTabItem(image: String, title: String) -> some View {
        VStack {
            Image(image).renderingMode(.template)
            Text(title)
                .font(.custom("Lato-Regular", size: 18))
        }
    }
}

private struct TabBarView: View {
    var body: some View {
        TabView {
            NavigationViewWithRootView(
                image: "library",
                title: "Chorld library"
            ) {
                ChordsLibraryView()
            }
            NavigationViewWithRootView(
                image: "make",
                title: "Make sequence"
            ) {
                MakeSequenceView()
            }
            NavigationViewWithRootView(
                image: "user",
                title: "Your sequences"
            ) {
                YourSequencesView()
            }
        }.accentColor(Color("Blue2"))
    }
}

// MARK: - Extensions

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

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
