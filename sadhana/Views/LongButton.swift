//
//  DashedButton.swift
//  sadhana
//
//  Created by Nikolai Kuznetcov on 2023-08-09.
//

import SwiftUI

enum LongButtonBorderStyle {
    case dashed
    case solid
}

struct LongButton: View {
    let label: String
    var icon: String?
    var iconColor: Color?
    var color: Color?
    var asset: String?
    var borderStyle: LongButtonBorderStyle = LongButtonBorderStyle.solid
    var alignment: Alignment = Alignment.center
    var padding: Edge.Set = .all
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                if icon != nil {
                    Image(systemName: icon!)
                        .foregroundColor(iconColor ?? .white)
                }
                if asset != nil {
                    Image(asset!)
                        .padding(.horizontal, 10)
                }
                Text(label)
                    .font(.system(size: 20))
                    .foregroundColor(color ?? .white)
            }
            .frame(maxWidth: .infinity, minHeight: 66, alignment: alignment)
        }
        .buttonStyle(LongButtonStyle(borderStyle: borderStyle))
    }
}

private struct LongButtonStyle: ButtonStyle {
    let borderStyle: LongButtonBorderStyle;
    let borderColor = Color(red: 0.25, green: 0.25, blue: 0.26);
    
    func makeBody(configuration: Configuration) -> some View {
        let stroke = borderStyle == LongButtonBorderStyle.solid
            ? StrokeStyle(lineWidth: 1)
            : StrokeStyle(lineWidth: 2, dash: [5])
        
        configuration.label
            .opacity(configuration.isPressed ? 0.1 : 1.0)
            .background(
                RoundedRectangle(cornerRadius: 36)
                    .stroke(style: stroke)
                    .foregroundColor(borderColor)
            )
            .background(
                RoundedRectangle(cornerRadius: 25).fill(borderColor.opacity(0.01))
            )
    }
}

