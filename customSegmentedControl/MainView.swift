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
            options: CustomSegmentedControl.allCases,
            config: CustomSegmentedControlConfig(
                selectedColor: .orange,
                deselectedColor: .gray,
                animation: Animation.spring(dampingFraction: 0.7),
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
