import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      SymbolsView(viewModel: SymbolsViewModel())
      FontStylesView()
      InstalledFontsView(viewModel: InstalledFontsViewModel())
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
