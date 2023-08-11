//
//  AppBackground.swift
//  sadhana
//
//  Created by Nikolai Kuznetcov on 2023-08-09.
//

import SwiftUI

struct AppBackground: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(
                colors: [
                    Color(red: 0.11, green: 0.12, blue: 0.13),
                    Color(red: 0.08, green: 0.09, blue: 0.09)
                ]
            ),
            startPoint: UnitPoint(x: 0.5, y: 0.8),
            endPoint: .bottom
        )
    }
}
