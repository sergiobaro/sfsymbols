import Foundation
import Combine
import UIKit

class SymbolsViewModel: ObservableObject {
  
  @Published var searchText = ""
  @Published var symbols = [String]()
  
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    self.symbols = Symbols.symbols
    
    $searchText
      .dropFirst()
      .debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
      .sink(receiveValue: { value in
        // With hundreds of elements List has a performance issue
        // emptying the array before updating helps
        // https://forums.developer.apple.com/thread/123882#387321
        self.symbols = []
        
        DispatchQueue.main.async {
          if value.isEmpty {
            self.symbols = Symbols.symbols
          } else {
            self.symbols = Symbols.symbols.filter { $0.contains(value) }
          }
        }
      })
      .store(in: &cancellables)
  }
  
  func selected(symbolName: String) {
    UIPasteboard.general.string = symbolName
  }
  
}
