//
//  GeometryReader.swift
//  KlugViewDimension
//
//  Created by Evans Domina Attafuah on 08/11/2021.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .fill(.blue)
                .frame(width: proxy.size.width * 0.5)
        }
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
