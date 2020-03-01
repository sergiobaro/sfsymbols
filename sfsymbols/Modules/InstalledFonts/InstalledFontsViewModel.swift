import Foundation
import Combine

class InstalledFontsViewModel: ObservableObject {
  
  @Published var fontNames = [String]()
  @Published var searchText = ""
  
  private let installedFonts = InstalledFontsRepository()
  private let pasteboard = PasteboardRepository()
  private var cancellables = Set<AnyCancellable>()
  
  init() {
    self.fontNames = self.installedFonts.allFontNames()
    
    $searchText
      .dropFirst()
      .debounce(for: .seconds(0.1), scheduler: DispatchQueue.main)
      .sink(receiveValue: { value in
        // With hundreds of elements List has a performance issue
        // emptying the array before updating helps
        // https://forums.developer.apple.com/thread/123882#387321
        self.fontNames = []
        
        DispatchQueue.main.async {
          if value.isEmpty {
            self.fontNames = self.installedFonts.allFontNames()
          } else {
            self.fontNames = self.installedFonts.allFontNames().filter {
              $0.lowercased().contains(value)
            }
          }
        }
      })
      .store(in: &cancellables)
  }
  
  func selected(fontName: String) {
    self.pasteboard.paste(string: fontName)
  }
}
