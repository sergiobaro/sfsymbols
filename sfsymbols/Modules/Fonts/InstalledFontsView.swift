import SwiftUI

struct InstalledFontsView: View {
  @ObservedObject var viewModel: InstalledFontsViewModel
  
  var body: some View {
    NavigationView {
      List(viewModel.fonts, id: \.self) { fontName in
        Text(fontName)
      }
      .navigationBarTitle("Installed Fonts")
    }
    .tabItem {
      Text("Installed Fonts")
    }
  }
}

struct InstalledFontsView_Previews: PreviewProvider {
  static var previews: some View {
    InstalledFontsView(viewModel: InstalledFontsViewModel())
  }
}
