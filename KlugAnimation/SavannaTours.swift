import SwiftUI

struct SavannaTours: View {
    @State private var zoomed = false
    
    var body: some View {
        VStack(spacing: 0) {
            HeroImage(name: "hero")
            
            ZStack {
                HStack {
                    TourTitle(title: "Savanna Trek", caption: "15 mile drive followed by an hour long trek")
                        .padding(.leading, 30)
                        .offset(x: zoomed ? 500 : 0, y: -15)
                        .animation(.default, value: zoomed)
                    
                    Spacer()
                }
                
                GeometryReader {
                    Image("thumb")
                        .clipShape(RoundedRectangle(cornerRadius: zoomed ? 40 : 500))
                        .overlay(
                            Circle()
                                .fill(zoomed ? .clear : Color(red: 1.0, green: 1.0, blue: 1.0, opacity: 0.4))
                                .scaleEffect(0.8)
                        )
                        .saturation(zoomed ? 1 : 0)
                        .rotationEffect(.degrees(zoomed ? 360 : 0))
                        .position(x: zoomed ? $0.frame(in: .local).midX : 600, y: 60)
                        .scaleEffect(zoomed ? 1.33 : 0.33)
                        .shadow(radius: 10)
                        .onTapGesture {
                            withAnimation(.spring()) {
                                zoomed.toggle()
                            }
                        }
                }
            }
            .background(Color(red: 0.1, green: 0.1, blue: 0.1))
            
            MilestonesList()
        }
    }
}

struct HeroImage: View {
    let name: String
    
    var body: some View {
        Image(name)
            .resizable()
            .edgesIgnoringSafeArea(.top)
            .frame(height: 300)
    }
}

struct MilestonesList: View {
    var body: some View {
        List(0 ... 4, id: \.self) { num in
            VStack(alignment: .leading) {
                Text("Milestone #\(num + 1)")
                    .font(.title)
                HStack(alignment: .lastTextBaseline) {
                    Text("Savanna National Park (\(num * 12 + 5)km)")
                        .font(.subheadline)
                    Image(systemName: "pin")
                    Spacer()
                    Text("South Africa")
                        .font(.subheadline)
                }
            }
            .padding()
        }
    }
}

struct TourTitle: View {
    let title: String
    let caption: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .fontWeight(.bold)
                .shadow(radius: 5)
                .foregroundColor(.white)
            
            Text(caption)
                .font(.caption)
                .foregroundColor(.white)
        }
    }
}

struct SavannaTours_Previews: PreviewProvider {
    static var previews: some View {
        SavannaTours()
    }
}
