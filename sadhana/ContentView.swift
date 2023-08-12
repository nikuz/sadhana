//
//  ContentView.swift
//  sadhana
//
//  Created by Nikolai Kuznetcov on 2023-08-08.
//

import SwiftUI

struct ContentView: View {
    @State private var practiceSelectorIsVisible = false
    @State private var practiceCreatorIsVisible = false
    @State private var practice: Practice?
    
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
                        practiceSelectorIsVisible = true
                    }
                )
                .padding(.horizontal)
            }
            
            BottomDrawer(isPresented: $practiceSelectorIsVisible) {
                LongButton(
                    label: "Meditation",
                    asset: "meditation",
                    alignment: .leading,
                    action: {
                        practice = Practice(type: PracticeType.meditation)
                        practiceSelectorIsVisible = false
                        practiceCreatorIsVisible = true
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
                        practice = Practice(type: PracticeType.kirtan)
                        practiceSelectorIsVisible = false
                        practiceCreatorIsVisible = true
                    }
                )
                .padding(.horizontal, 12)
            }
            
            BottomDrawer(isPresented: $practiceCreatorIsVisible) {
                if (practice != nil) {
                    PracticeCreator(practice: practice!, onSaved: { duration, practice in
                        print(duration)
                        print(practice)
                        practiceCreatorIsVisible = false
                    })
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
