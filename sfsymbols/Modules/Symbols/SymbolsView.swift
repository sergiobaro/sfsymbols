import SwiftUI
import UIKit

struct SymbolsView: View {
  @ObservedObject var viewModel: SymbolsViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(searchText: $viewModel.searchText)
        
        List(viewModel.symbols, id: \.self) { symbolName in
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
      .navigationBarTitle("SF Symbols")
    }
    .tabItem {
      Text("SF Symbols")
    }
  }
  
  private func paste(symbolName: String) {
    UIPasteboard.general.string = symbolName
  }
}

struct SymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolsView(viewModel: SymbolsViewModel())
  }
}
