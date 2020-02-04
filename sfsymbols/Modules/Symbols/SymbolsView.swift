import SwiftUI

struct SymbolsView: View {
  @ObservedObject var viewModel: SymbolsViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        SearchBar(searchText: $viewModel.searchText)
        
        List(viewModel.symbols, id: \.self) { symbolName in
          Button(action: {
            self.viewModel.selected(symbolName: symbolName)
          }) {
            HStack {
              Image(systemName: symbolName)
                .font(.largeTitle)
              Text(symbolName)
                .padding()
              Spacer()
              Image(systemName: "doc.on.clipboard")
            }
          }
        }
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
