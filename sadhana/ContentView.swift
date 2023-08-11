//
//  ContentView.swift
//  sadhana
//
//  Created by Nikolai Kuznetcov on 2023-08-08.
//

import SwiftUI

struct ContentView: View {
    @State private var showingCredits = false
    
    var body: some View {
        ZStack {
            AppBackground().ignoresSafeArea()
            VStack() {
                LongButton(
                    label: "Add practice",
                    icon: "plus",
                    iconColor: .orange,
                    borderStyle: LongButtonBorderStyle.dashed,
                    action: {
                        showingCredits.toggle()
                    }
                )
                .padding(.horizontal)
            }
            
            BottomDrawer(isPresented: $showingCredits) {
                LongButton(
                    label: "Meditation",
                    asset: "meditation",
                    alignment: .leading,
                    action: {
                        print("add meditation")
                        
                    }
                )
                .padding(.horizontal, 12)
                .padding(.top, 10)
                .padding(.bottom, 5)
                LongButton(
                    label: "Kirtan",
                    asset: "kirtan",
                    alignment: .leading,
                    action: {
                        print("add kirtan")
                    }
                )
                .padding(.horizontal, 12)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
