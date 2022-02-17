//
//  ContentView.swift
//  Shared
//
//  Created by Brian Strobach on 1/14/22.
//

import SwiftUI
import UIKitTheme

struct ContentView: View {
    var body: some View {
        Text(SwiftPackageClass().text)
            .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
