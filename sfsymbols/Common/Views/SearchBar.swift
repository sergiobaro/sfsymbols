import SwiftUI
import UIKit

struct SearchBar: UIViewRepresentable {
  
  @Binding var searchText: String
  
  func makeUIView(context: UIViewRepresentableContext<SearchBar>) -> UISearchBar {
    let searchBar = UISearchBar(frame: .zero)
    searchBar.delegate = context.coordinator
    searchBar.autocapitalizationType = .none
    searchBar.enablesReturnKeyAutomatically = false
    
    return searchBar
  }
  
  func updateUIView(_ uiView: UISearchBar, context: UIViewRepresentableContext<SearchBar>) {
    uiView.text = self.searchText
  }
  
  func makeCoordinator() -> SearchBar.Coordinator {
    return Coordinator(self)
  }
  
  // MARK: - Coordinator
  
  class Coordinator: NSObject, UISearchBarDelegate {
    
    var searchBar: SearchBar
    
    init(_ searchBar: SearchBar) {
      self.searchBar = searchBar
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
      self.searchBar.searchText = searchText
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
      searchBar.resignFirstResponder()
    }
  }
}

struct SearchBar_Previews: PreviewProvider {
  static var previews: some View {
    SearchBar(searchText: .constant(""))
  }
}
