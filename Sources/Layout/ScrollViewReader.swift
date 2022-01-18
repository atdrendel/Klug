import SwiftUI

struct ScrollViewReaderView: View {
  @State private var selectedGenre = Genre.list.first

  var body: some View {
    NavigationView {
      ScrollView {
        ScrollViewReader { proxy in
          LazyVStack {
            ForEach(Genre.list) { genre in
              genre.subgenres.randomElement()!.view
                .id(genre)
            }
          }
          .onChange(of: selectedGenre) { genre in
            selectedGenre = nil

            withAnimation {
              proxy.scrollTo(genre)
            }
          }
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbar {
        ToolbarItem {
          Menu("Genre") {
            ForEach(Genre.list) { genre in
              Button(genre.name) {
                selectedGenre = genre
              }
            }
          }
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
        Image("Genre/\(Int.random(in: 1...92))")
          .resizable()
          .saturation(0)
          .blendMode(.multiply)
          .scaledToFit()
      )
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

struct ScrollViewReader_Previews: PreviewProvider {
  static var previews: some View {
      ScrollViewReaderView()
  }
}
