import SwiftUI

struct TestView: View {
    @State private var searchText = ""

    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: [.init()]) {
                    ForEach(Category.categories) { category in

                        VStack(alignment: .leading) {
                            title(category.type.rawValue)

                            VStack {
                                movies(category.movies)
                            }
                            .padding()
                            .frame(height: 146)
                            .background(
                                RoundedRectangle(cornerRadius: 14, style: .circular)
                                    .fill(category.color)
                            )
                        }
                    }
                }
                .padding()
                .navigationBarTitle(
                    Text("Discover & Watch"), displayMode: .automatic
                )
                .searchable(text: $searchText)
            }
        }
    }

    func title(_ text: String) -> some View {
        Text(text)
            .foregroundColor(.primary)
            .bold()
            .font(.title3)
            .padding(.top)
            .padding(.bottom)
    }

    func movies(_ movies: [String]) -> some View {
        let columns = Array(repeating: GridItem(), count: 2)
        return LazyVGrid(
            columns: columns
        ) {
            ForEach(movies, id: \.self) { movie in
                NavigationLink(movie) {
                    Text(movie)
                        .font(.subheadline)
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .padding(.horizontal, 16)
                .foregroundColor(.white)
                .background(
                    RoundedRectangle(cornerRadius: 14, style: .circular)
                        .fill(.black)
                )
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
            .preferredColorScheme(.dark)
        TestView().preferredColorScheme(.light)
    }
}
