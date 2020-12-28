//
//  ChordsLibraryView.swift
//  GuitarChords
//
//  Created by Volodymyr Rykhva on 27.12.2020.
//

import SwiftUI

struct ChordsLibraryView: View {
    var body: some View {
        Text("ChordsLibraryView")
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
