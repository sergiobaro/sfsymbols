import SwiftUI

struct SymbolsView: View {
  @ObservedObject var viewModel: SymbolsViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(searchText: $viewModel.searchText)
        
        SymbolsGridView(
          symbols: $viewModel.symbols,
          onSelect: { self.viewModel.selected(symbolName: $0) }
        )
//        SymbolsListView(
//          symbols: $viewModel.symbols,
//          onSelect: { self.viewModel.selected(symbolName: $0) }
//        )
      }
      .navigationBarTitle("SF Symbols (\(viewModel.symbols.count))")
    }
    .tabItem {
      Text("SF Symbols")
    }
  }
}

struct SymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolsView(viewModel: SymbolsViewModel())
  }
}
