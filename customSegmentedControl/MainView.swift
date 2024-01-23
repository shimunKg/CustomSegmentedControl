//
//  MainView.swift
//  customSegmentedControl
//
//  Created by Nikola Jovanovic Simunic on 19.12.23..
//

import SwiftUI

struct MainView: View {
    @State var selectedValue: CustomSegmentedControl = .home
    var body: some View {
        CustomSegmentedControlView(
            selection: $selectedValue,
            options: [.home, .filtered, .profile, .settings, .views(numerOfViews: 52)],
            config: CustomSegmentedControlConfig(
                selectedColor: .orange,
                deselectedColor: .gray,
                animation: Animation.bouncy,
                spacingBetweenElements: 10,
                stackHeight: 40,
                cornerRadius: 16
            )
        )
    }
}

#Preview {
    MainView()
}
