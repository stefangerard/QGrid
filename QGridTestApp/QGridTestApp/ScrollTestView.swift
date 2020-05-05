//
//  ScrollTestView.swift
//  QGridTestApp
//
//  Created by Gerard, Stefan on 05.05.20.
//  Copyright © 2020 q-mobile. All rights reserved.
//

import QGrid
import SwiftUI

struct ScrollTestView: View {
    @State var width: CGFloat = 0

    struct Item: Identifiable {
        var id = UUID().uuidString
        var value: String
    }

//    struct WidthPreferenceKey: PreferenceKey {
//        typealias Value = [CGFloat]
//
//        static var defaultValue: [CGFloat] = [0]
//
//        static func reduce(value: inout [CGFloat], nextValue: () -> [CGFloat]) {
//            value.append(contentsOf: nextValue())
//        }
//    }

    func items() -> [Item] {
        var items = [Item]()
        for i in 0..<100 {
            items.append(Item(value: "Item #\(i)"))
        }
        return items
    }

    var body: some View {
        ScrollView {
            VStack(spacing: 0) {
                Image(systemName: "circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 150)
                    .padding()
                    .foregroundColor(.green)

                QGrid(self.items(), columns: 2, hSpacing: 2, isScrollable: false) { item, index, width in
                    Text(item.value + " index = \(index)")
                        .frame(width: width / CGFloat(2), height: width / CGFloat(2))
                        .background(Color.red)
                }

//                GeometryReader { geometry in
//                    VStack {
//                        EmptyView()
//
//                    }.preference(key: WidthPreferenceKey.self, value: [geometry.size.width])
//                }
//                .frame(height: 0)
//
//                ForEach(self.items()) { item in
//                    Text(item.value)
//                        .frame(width: self.width / CGFloat(2), height: self.width / CGFloat(2))
//                        .background(Color.red)
//                }
            }
            .padding()
        }
//        .onPreferenceChange(WidthPreferenceKey.self) { value in
//            self.width = value[0]
//        }
    }
}

struct ScrollTestView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTestView()
    }
}
