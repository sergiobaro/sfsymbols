import Foundation
import Combine

class SymbolsViewModel: ObservableObject {
  
  @Published var symbols = [String]()
  @Published var searchText = ""
  
  private let symbolsRepository = SymbolsRepository()
  private let pasteboard = PasteboardRepository()
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    self.symbols = self.symbolsRepository.allSymbols()
    
    $searchText
      .dropFirst()
      .debounce(for: .seconds(0.1), scheduler: DispatchQueue.main)
      .sink(receiveValue: { value in
        // With hundreds of elements List has a performance issue
        // emptying the array before updating helps
        // https://forums.developer.apple.com/thread/123882#387321
        self.symbols = []
        
        DispatchQueue.main.async {
          if value.isEmpty {
            self.symbols = self.symbolsRepository.allSymbols()
          } else {
            self.symbols = self.symbolsRepository.allSymbols().filter { $0.contains(value) }
          }
        }
      })
      .store(in: &cancellables)
  }
  
  func selected(symbolName: String) {
    self.pasteboard.paste(string: symbolName)
  }
}
