import SwiftUI

struct SymbolsGridView: View {
  
  @Binding var symbols: [String]
  let onSelect: (String) -> Void
  
  private let columns = 4
  private var rows: Int {
    self.symbols.count / self.columns
  }
  private var lastRowColumns: Int {
    self.symbols.count % self.columns
  }
  
  struct RowIndex: Identifiable {
    let row: Int
    let columns: Int
    
    var id: String { "row \(row)" }
  }
  
  struct CellIndex: Identifiable {
    let columns: Int
    let row: Int
    let column: Int
    
    var id: Int { self.columns * self.row + self.column }
  }
  
  var body: some View {
    ScrollView {
      ForEach((0..<self.rows).map({ RowIndex(row: $0, columns: self.columns) })) { rowIndex in
        self.row(rowIndex: rowIndex)
      }
      if self.lastRowColumns > 0 {
        self.row(rowIndex: RowIndex(row: self.rows, columns: self.lastRowColumns))
      }
    }
  }
  
  private func symbolName(index: CellIndex) -> String {
    if self.symbols.indices.contains(index.id) {
      return self.symbols[index.id]
    }
    return ""
  }
  
  private func row(rowIndex: RowIndex) -> some View {
    HStack {
      ForEach((0..<self.columns).map({ CellIndex(columns: self.columns, row: rowIndex.row, column: $0) })) { index in
        if index.column == 0 { Spacer() }
        
        if index.column < rowIndex.columns {
          SymbolGridCellView(
            symbolName: self.symbolName(index: index),
            onSelect: self.onSelect
          )
        } else {
          Spacer(minLength: 80)
        }
      
        Spacer()
      }
    }
  }
}

struct SymbolsGridView_Previews: PreviewProvider {
  static var previews: some View {
    SymbolsGridView(
      symbols: .constant(["symbol", "long.symbol.name.multiline"]),
      onSelect: { print($0) }
    )
  }
}
