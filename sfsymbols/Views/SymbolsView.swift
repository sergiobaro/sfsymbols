import SwiftUI

struct SymbolsView: View {
  var body: some View {
    List(Symbols.symbols, id: \.self) { symbolName in
      Text(symbolName)
      Image(systemName: symbolName)
    }
  }
}

struct SymbolsView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolsView()
  }
}
