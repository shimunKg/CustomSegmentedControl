//
//  ContentView.swift
//  customSegmentedControl
//
//  Created by Nikola Jovanovic Simunic on 19.12.23..
//
import SwiftUI
protocol HasTitle {
    var title: String { get }
}

enum CustomSegmentedControl: String, CaseIterable, HasTitle {
    case home
    case profile
    case settings
    case something
    case additionallllfkiflll
  
    
    var title: String {
        return self.rawValue.capitalized
    }
}

struct CustomSegmentedControlView<T>: View where T: Hashable, T: HasTitle {
    
    @Namespace var namespace
    @Binding var selection: T
    var options: [T]
    var config: CustomSegmentedControlConfig
    

    var body: some View {
        ScrollViewReader { scrollReader in
            ScrollView(.horizontal, showsIndicators: false) {
                LazyHStack(spacing: config.spacingBetweenElements) {
                    ForEach(options, id: \.self) { option in
                        ZStack {
                            if selection == option {
                                RoundedRectangle(cornerRadius: config.cornerRadius)
                                    .fill(config.selectedColor)
                                    .matchedGeometryEffect(id: "ID", in: namespace)
                            } else {
                                RoundedRectangle(cornerRadius: config.cornerRadius)
                                    .fill(config.deselectedColor)
                            }
                            Text(option.title)
                                .buttonStyle(PlainButtonStyle())
                                .id(option)
                                .onTapGesture(perform: {
                                    withAnimation(config.animation) {
                                        selection = option
                                        scrollReader.scrollTo(option, anchor: selection == options.last ? .trailing : .center)
                                    }
                                })
                                .padding(.horizontal, selection == option ? 25 : 8)
                                .padding(.vertical, 10)
                        }
                        .frame(height: config.stackHeight)
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}


#Preview {
     enum TestSegmentedControl: String, CaseIterable, HasTitle {
        case test1
        case test2
        case test3
        case test43
        case test453
        case test523
        case test5234

        var title: String {
            self.rawValue
        }
    }
    
    let config = CustomSegmentedControlConfig(
        selectedColor: .orange,
        deselectedColor: .gray,
        animation: Animation.spring,
        spacingBetweenElements: 10,
        stackHeight: 40,
        cornerRadius: 20
    )
   return CustomSegmentedControlView(
        selection: .constant(TestSegmentedControl.test1),
        options: TestSegmentedControl.allCases, config: config
    )
}
