import UIKit

struct InstalledFontsRepository {
  
  private let fontNames: [String]
  
  init() {
    var fontNames = [String]()
    UIFont.familyNames.forEach { familyName in
      UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
        fontNames.append(fontName)
      }
    }
    self.fontNames = fontNames.sorted()
  }
  
  func allFontNames() -> [String] {
    return self.fontNames
  }
}
