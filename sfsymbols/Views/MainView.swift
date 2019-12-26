import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      NavigationView {
        SymbolsView()
          .navigationBarTitle("SF Symbols")
      }
      .tabItem {
        Text("SF Symbols")
      }
      
      NavigationView {
        FontStyleView()
          .navigationBarTitle("Font Style")
      }
      .tabItem {
        Text("Font Style")
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
