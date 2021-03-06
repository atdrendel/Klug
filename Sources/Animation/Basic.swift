import SwiftUI

public class BasicViewModel: ObservableObject {
    
    @Published public var circleCenter = CGPoint.zero
    @Published public var isCircleScaled = false
    @Published public var circleColor: Color = .black
    
    public init(){}
}

public struct BasicView: View {
    @ObservedObject var basicViewModel: BasicViewModel
    
    public init(_ basicViewModel: BasicViewModel = .init()) {
        self.basicViewModel = basicViewModel
    }
    
    public var body: some View {
        VStack {
            Circle()
                .fill(basicViewModel.circleColor)
                //  .animation(.linear)
                .overlay(Text("Hi"))
                .foregroundColor(basicViewModel.isCircleScaled ? .red : nil)
                .frame(width: 50, height: 50)
                .scaleEffect(basicViewModel.isCircleScaled ? 2 : 1)
                .offset(x: basicViewModel.circleCenter.x - 25, y: basicViewModel.circleCenter.y - 25)
                //     .animation(.spring(response: 0.2, dampingFraction: 0.1))
                .gesture(
                    DragGesture(minimumDistance: 0)
                        .onChanged { value in
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.1)) {
                                basicViewModel.circleCenter = value.location
                            }
                        }
                )
            
            Toggle("Scale", isOn: $basicViewModel.isCircleScaled.animation(.spring(response: 0.3, dampingFraction: 0.1)))
            
            Button("Cycle colors") {
                [Color.red, .blue, .green, .pink, .black].enumerated().forEach { offset, color in
                    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(offset)) {
                        withAnimation(.linear) {
                            basicViewModel.circleColor = color
                        }
                    }
                }
            }
            
            Button("Reset") {
                withAnimation {
                    basicViewModel.circleCenter = .zero
                    basicViewModel.circleColor = .black
                }
                basicViewModel.isCircleScaled = false
            }
        }
    }
}

struct Basic_Previews: PreviewProvider {
    static var previews: some View {
        BasicView()
    }
}
