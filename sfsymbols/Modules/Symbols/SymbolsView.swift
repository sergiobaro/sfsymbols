import SwiftUI
import UIKit

struct SymbolsView: View {
  
  @State private var searchText: String = ""
  
  var body: some View {
    VStack {
      SearchBar(searchText: $searchText)
      
      List(Symbols.symbols.filter {
        self.searchText.isEmpty ? true : $0.contains(self.searchText)
      }, id: \.self) { symbolName in
        Button(action: {
          self.paste(symbolName: symbolName)
        }) {
          HStack {
            Image(systemName: symbolName)
              .font(.largeTitle)
            Text(symbolName)
              .padding()
            Spacer()
          }
        }
      }
    }
  }
  
  private func paste(symbolName: String) {
    UIPasteboard.general.string = symbolName
  }
}

struct SymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolsView()
  }
}
