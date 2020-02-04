import Foundation
import UIKit

class InstalledFontsViewModel: ObservableObject {
  
  @Published var fonts = [String]()
  
  init() {
    var fonts = [String]()
    UIFont.familyNames.forEach { familyName in
      UIFont.fontNames(forFamilyName: familyName).forEach { fontName in
        fonts.append("\(familyName), \(fontName)")
      }
    }
    
    self.fonts = fonts
  }
  
}
