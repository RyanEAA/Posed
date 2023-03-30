//
//  SearchBar.swift
//  Posed
//
//  Created by Ryan Aparicio on 3/29/23.
//

import Foundation
import SwiftUI

struct SearchBar: UIViewRepresentable {
    @Binding var text: String

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar()
        searchBar.delegate = context.coordinator
        return searchBar
    }

    func updateUIView(_ uiView: UISearchBar, context: Context) {
        uiView.text = text
    }

    class Coordinator: NSObject, UISearchBarDelegate {
        var parent: SearchBar

        init(_ searchBar: SearchBar) {
            self.parent = searchBar
        }

        func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
            parent.text = searchText
        }

        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchBar.resignFirstResponder()
        }
    }
}
