import Nett
import SwiftUI
import UIKit

#if DEBUG
import SwiftUI
struct NettTabbarView: UIViewControllerRepresentable {
    typealias UIViewControllerType = NettTabbar

    func makeUIViewController(context: Context) -> NettTabbar {
        .init(viewControllers: [
            .init(
                label: .init()
            ),
        ])
    }

    func updateUIViewController(_ uiViewController: NettTabbar, context: Context) {}
}

@available(iOS 13.0, *)
struct NettTabbarPreview_Preview: PreviewProvider {
    static var previews: some View {
        NettTabbarView().ignoresSafeArea().preferredColorScheme(.dark)
    }
}
#endif
