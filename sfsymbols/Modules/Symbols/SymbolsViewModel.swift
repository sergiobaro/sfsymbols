import Foundation
import Combine

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
        if value.isEmpty {
          self.symbols = Symbols.symbols
        } else {
          self.symbols = Symbols.symbols.filter { $0.contains(value) }
        }
      })
      .store(in: &cancellables)
  }
  
}
