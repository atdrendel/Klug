import SwiftUI
import KlugHelpers

struct LazyVStackView: View {
  var body: some View {
    ScrollView {
        LazyVStack {
        let formatter: DateFormatter = {
          let formatter = DateFormatter()
          formatter.timeStyle = .medium
          return formatter
        } ()

        ForEach(Genre.list.flatMap(\.subgenres)) { subgenre in
          Text(
            formatter.string(from: Date())
          )

          subgenre.view
        }
      }
    }
  }
}

private extension Genre.Subgenre {
  var view: some View {
    RoundedRectangle(cornerRadius: 8)
      .fill(
        LinearGradient(
          gradient: .init(
            colors: AnyIterator { } .prefix(2).map {
              .random(saturation: 2 / 3, value: 0.85)
            }
          ),
          startPoint: .topLeading, endPoint: .bottomTrailing
        )
      )
      .frame(width: 125, height: 125)
      .overlay(
        Text(name)
          .foregroundColor(.white)
          .fontWeight(.bold)
          .padding(10)
          .frame(alignment: .bottomLeading),
        alignment: .bottomLeading
      )
  }
}

struct LazyVStack_Previews: PreviewProvider {
  static var previews: some View {
      LazyVStackView()
  }
}
