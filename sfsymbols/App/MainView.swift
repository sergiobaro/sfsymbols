import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      SymbolsView(viewModel: SymbolsViewModel())
      FontStyleView()
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
