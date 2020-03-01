import SwiftUI

struct FontStylesView: View {
  var body: some View {
    NavigationView {
      List {
        Text("Large Title").font(.largeTitle)
        Text("Title").font(.title)
        Text("Headline").font(.headline)
        Text("Subheadline").font(.subheadline)
        Text("Body").font(.body)
        Text("Callout").font(.callout)
        Text("Footnote").font(.footnote)
        Text("Caption").font(.caption)
      }
      .listStyle(GroupedListStyle())
      .navigationBarTitle("Font Styles")
    }
    .tabItem {
      Text("Font Styles")
    }
  }
}

struct FontStyleView_Previews: PreviewProvider {
  static var previews: some View {
    FontStylesView()
  }
}
