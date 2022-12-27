//
//  DynamicInslandApp.swift
//  DynamicInslandApp
//
//  Created by Anna Kocheshkova on 22.10.2022.
//

import WidgetKit
import SwiftUI
import Intents

struct DynamicInslandApp: Widget {
    
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: FitnessAttributes.self) { context in
        } dynamicIsland: { context in
            DynamicIsland() {
                DynamicIslandExpandedRegion(.bottom) {
                    BottomView(context: context)
                }
            } compactLeading: {
                Image("fire-big")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .tint(Constants.DynamicIsland.startButtonColor)
                    .padding([.top, .bottom], 9)
                    .padding(.leading, 12)
            } compactTrailing: {
                Image("bell-big")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding([.top, .bottom], 9)
                    .padding(.trailing, 12)
            } minimal: {
                Image("fire-big")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .tint(Constants.DynamicIsland.startButtonColor)
                    .padding([.top, .bottom], 9)
                    .padding(.leading, 12)
                    .tint(Constants.DynamicIsland.startButtonColor)

            }
        }
    }
    
    struct BottomView: View {
        let context: ActivityViewContext<FitnessAttributes>
        
        var body: some View {
            VStack(spacing: 12) {
                HStack {
                    LeadingView(context: context)
                    Spacer()
                    TrailingView(context: context)
                }
                SmallBottomView(context: context)
            }
        }
    }
    
    struct SmallBottomView: View {
        let context: ActivityViewContext<FitnessAttributes>

        var body: some View {
            HStack {
                Link(destination: URL(string: "widget://details")!) {
                    Button {

                    } label: {
                        Text(Constants.DynamicIsland.startButtonName)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: Constants.DynamicIsland.buttonHeight)
                    .foregroundColor(Constants.DynamicIsland.changeButtonColor)
                    .background(Constants.DynamicIsland.startButtonColor)
                    .cornerRadius(Constants.DynamicIsland.buttonHeight)
                }
                
                Link(destination: URL(string: "widget://list")!) {
                    Button {
                        
                    } label: {
                        Text(Constants.DynamicIsland.changeButtonName)
                    }
                    .frame(minWidth: 100, maxWidth: .infinity, minHeight: Constants.DynamicIsland.buttonHeight)
                    .foregroundColor(Constants.DynamicIsland.startButtonColor)
                    .background(Constants.DynamicIsland.changeButtonColor)
                    .cornerRadius(Constants.DynamicIsland.buttonHeight)
                }
            }
        }
        
        init(context: ActivityViewContext<FitnessAttributes>) {
            self.context = context
        }
    }
    
    struct TrailingView: View {
        let context: ActivityViewContext<FitnessAttributes>
        
        var body: some View {
            VStack(alignment: .trailing) {
                ComplexityView(complexity: context.attributes.complexity)
                Text(context.attributes.calories).subtitle()
            }
        }
    }
    
    struct LeadingView: View {
        @State var context: ActivityViewContext<FitnessAttributes>

        var body: some View {
            VStack {
                HStack(spacing: 10) {
                    Image(context.attributes.imageName)
                        .frame(width: 40, height: 40)
                        .cornerRadius(20)
                    VStack(alignment: .leading) {
                        Text(context.attributes.trainingName).title()
                        Text(context.attributes.lessonLength)
                            .font(.system(size: 16))
                    }
                }
            }
        }
    }
}
