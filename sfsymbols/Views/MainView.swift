import SwiftUI

struct MainView: View {
  var body: some View {
    TabView {
      NavigationView {
        FontStyleView()
          .navigationBarTitle("Font Style")
      }
      .tabItem {
        Text("Font Style")
      }
      
      NavigationView {
        SymbolsView()
          .navigationBarTitle("SF Symbols")
      }
      .tabItem {
        Text("SF Symbols")
      }
    }
  }
}

struct MainView_Previews: PreviewProvider {
  static var previews: some View {
    MainView()
  }
}
