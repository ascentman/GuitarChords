//
//  ChordsLibraryView.swift
//  GuitarChords
//
//  Created by Volodymyr Rykhva on 27.12.2020.
//

import SwiftUI

struct ChordsLibraryView: View {
    var body: some View {
        ZStack {
            Color("Background")
            VStack {
                Rectangle()
                    .cornerRadius(18)
                    .frame(width: 240, height: 50)
                    .padding(40)
                Image("guitar")
                Spacer()
                Rectangle()
                    .fill(Color("InactiveText"))
                    .frame(height: 140)
                    .cornerRadius(18, corners: [.topLeft, .topRight])
            }
        }
    }
}

struct ChordsLibraryView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ChordsLibraryView()
                .navigationBarTitle("Chords library", displayMode: .inline)
        }
    }
}

struct RoundedCorner: Shape {

    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
}
