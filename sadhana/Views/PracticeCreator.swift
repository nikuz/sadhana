//
//  PracticeCreator.swift
//  sadhana
//
//  Created by Nikolai Kuznetcov on 2023-08-11.
//

import SwiftUI

struct PracticeCreator: View {
    var practice: Practice
    let fastSelectionTime = [5, 10, 20, 30, 40]
    let onSaved: (_ duration: Int, _ practice: Practice) -> Void
    @State private var duration: Int = 15
    
    private func scrollToSelectedDuration(_ scrollProxy: ScrollViewProxy, _ number: Int) {
        withAnimation(.easeOut(duration: 3)) {
            scrollProxy.scrollTo(number, anchor: .center)
        }
    }
    
    var body: some View {
        VStack (alignment: .leading) {
            HStack {
                Image(practice.icon)
                    .padding(.horizontal, 10)
                Text("\(practice.name) (min)")
                    .font(.system(size: 20))
                Spacer()
            }
            .padding()
            
            ScrollViewReader { scrollProxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(1..<61) { index in
                            if (index == 1) {
                                Spacer().frame(maxWidth: 0)
                            }
                            Button(action: {
                                duration = index
                                scrollToSelectedDuration(scrollProxy, index)
                            }) {
                                Text("\(index)")
                                    .font(.system(size: 25))
                                    .frame(width: 50, height: 50)
                                    .background(.white.opacity(index == duration ? 1 : 0))
                                    .foregroundColor(index == duration ? .black : .white)
                                    .cornerRadius(30)
                                    .id(index)
                            }
                            if (index == 60) {
                                Spacer().frame(maxWidth: 0)
                            }
                        }
                    }
                }
                .onAppear {
                    scrollToSelectedDuration(scrollProxy, duration)
                }
                .padding(.bottom, 15)
                
                HStack() {
                    ForEach(0..<fastSelectionTime.count, id: \.self) { index in
                        Button(action: {
                            duration = fastSelectionTime[index]
                            scrollToSelectedDuration(scrollProxy, fastSelectionTime[index])
                        }) {
                            Text("\(fastSelectionTime[index])")
                                .foregroundColor(.white)
                                .font(.system(size: 20))
                                .frame(width: 50, height: 50)
                                .background(
                                    RoundedRectangle(cornerRadius: 30)
                                        .stroke(style: StrokeStyle(lineWidth: 1))
                                        .foregroundColor(Color(red: 0.24, green: 0.24, blue: 0.25))
                                )
                        }
                        if (index < fastSelectionTime.count - 1) {
                            Spacer()
                        }
                    }
                }
                .padding(.horizontal)
            }
            
            Divider()
                .overlay(.gray)
                .padding(.top, 30)
            
            Button(action: {
                onSaved(duration, practice)
            }) {
                Text("Save")
                    .font(.system(size: 20))
                    .frame(maxWidth: .infinity)
                    .padding()
            }
        }
    }
}
