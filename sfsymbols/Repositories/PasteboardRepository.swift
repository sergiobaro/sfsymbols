import UIKit

struct PasteboardRepository {
  
  func paste(string: String) {
    UIPasteboard.general.string = string
  }
}
