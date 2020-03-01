import SwiftUI

struct SymbolGridCellView: View {
  
  let symbolName: String
  let onSelect: (String) -> Void
  
  var body: some View {
    Button(action: { self.onSelect(self.symbolName) }) {
      VStack {
        Image(systemName: self.symbolName)
          .resizable()
          .aspectRatio(contentMode: .fit)
          .frame(width: 40, height: 40)
        Text(self.symbolName)
          .font(.system(size: 8.0))
          .lineLimit(nil)
          .multilineTextAlignment(.center)
      }
      .frame(width: 80, height: 60)
    }
    .accentColor(.black)
  }
}

struct SymbolGridCellView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolGridCellView(symbolName: "00.circle", onSelect: { print($0) })
  }
}
