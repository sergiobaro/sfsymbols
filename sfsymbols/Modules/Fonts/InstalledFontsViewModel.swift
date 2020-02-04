import Foundation
import UIKit

class InstalledFontsViewModel: ObservableObject {
  
  @Published var fontNames = [String]()
  
  init() {
    var fontNames = [String]()
    UIFont.familyNames.forEach { familyName in
      UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
        fontNames.append(fontName)
      }
    }
    
    self.fontNames = fontNames.sorted()
  }
  
  func selected(fontName: String) {
    UIPasteboard.general.string = fontName
  }
}
