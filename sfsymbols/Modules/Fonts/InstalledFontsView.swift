import SwiftUI

struct InstalledFontsView: View {
  @ObservedObject var viewModel: InstalledFontsViewModel
  
  var body: some View {
    NavigationView {
      List(viewModel.fontNames, id: \.self) { fontName in
      Button(action: {
        self.viewModel.selected(fontName: fontName)
      }) {
          HStack {
            Text(fontName)
              .font(.custom(fontName, size: 20.0))
            Spacer()
            Image(systemName: "doc.on.clipboard")
          }
        }
      }
      .navigationBarTitle("Installed Fonts (\(viewModel.fontNames.count))")
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
