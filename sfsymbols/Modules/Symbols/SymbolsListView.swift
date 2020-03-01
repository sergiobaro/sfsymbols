import SwiftUI

struct SymbolsListView: View {
  
  @Binding var symbols: [String]
  let onSelect: (String) -> Void
  
  var body: some View {
    List(symbols, id: \.self) { symbolName in
      Button(action: { self.onSelect(symbolName) }) {
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
}

struct SymbolsListView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolsListView(
      symbols: .constant(Symbols.symbols),
      onSelect: { print($0) })
  }
}
