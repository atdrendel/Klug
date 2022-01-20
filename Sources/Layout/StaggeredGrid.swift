import SwiftUI

struct StaggeredGrid<Content: View, T: Identifiable> : View {
    var content: (T) -> Content
    
    var list: [T]
    
    var showsIndicators: Bool
    var spacing: CGFloat
    
    init(showsIndicators: Bool = false, spacing: CGFloat = 10, list: [T], @ViewBuilder content: @escaping (T) -> Content) {
        self.content = content
        self.list = list
        self.spacing = spacing
        self.showsIndicators = showsIndicators
    }
    
    var body: some View {
        
        ScrollView(.vertical, showsIndicators: showsIndicators) {
            VStack {
                ForEach(list) { object in
                    content(object)
                }
            }
        }
    }
}

struct Post: Identifiable {
    var id = UUID().uuidString
    var imageURL: String
}

struct Home: View {
    @State var posts = [Post]()
    var body: some View {
        NavigationView {
            StaggeredGrid(list: posts) { post in
                PostCardView(post: post)
            }
            .navigationTitle("Staggered")
        }
        .onAppear {
            for index in 1...30 {
                posts.append(.init(imageURL: "\(index).circle.fill"))
            }
        }
    }
}

struct PostCardView: View {
    var post: Post
    
    var body: some View {
        Image(systemName: post.imageURL)
            .font(.largeTitle)
            .aspectRatio(contentMode: .fill)
    }
}

struct StaggeredGrid_Previews: PreviewProvider {
    
    static var previews: some View {
       Home()
    }
}
