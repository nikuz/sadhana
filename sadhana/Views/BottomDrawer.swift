//
//  BottomDrawer.swift
//  sadhana
//
//  Created by Nikolai Kuznetcov on 2023-08-10.
//

import SwiftUI

struct BottomDrawer<Content: View>: View {
    var isPresented: Binding<Bool>
    let content: Content
    @State private var sheetHeight: CGFloat = .zero
    
    init(isPresented: Binding<Bool>, @ViewBuilder content: () -> Content) {
        self.isPresented = isPresented
        self.content = content()
    }
    
    var body: some View {
        ZStack {}.sheet(isPresented: isPresented) {
            VStack {
                content
            }
            .frame(maxWidth: .infinity)
            .presentationDragIndicator(.hidden)
            .presentationBackground(Color(red: 0.16, green: 0.16, blue: 0.17))
            .overlay {
                GeometryReader { geometry in
                    Color.clear.preference(key: InnerHeightPreferenceKey.self, value: geometry.size.height)
                }
            }
            .onPreferenceChange(InnerHeightPreferenceKey.self) { newHeight in
                sheetHeight = newHeight
            }
            .presentationDetents([.height(sheetHeight)])
            .foregroundColor(.white)
        }
    }
}

private struct InnerHeightPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
