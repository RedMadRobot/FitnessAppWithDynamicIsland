//
//  Arrows.swift
//  DynamicIslandPOC
//
//  Created by Anna Kocheshkova on 25.11.2022.
//

import Foundation
import SwiftUI

struct Arrows: View {
    
    let timer = Timer.publish(
        every: Constants.Slider.Arrows.repeatInterval,
        on: .main,
        in: .common)
    .autoconnect()
    
    @State var scale: CGFloat = Constants.Slider.Arrows.scaleInitial
    @State var fade: Double = Constants.Slider.Arrows.fadeInitial
    
    var body: some View {
        ZStack {
            HStack(spacing: 5) {
                ForEach(0..<Constants.Slider.Arrows.arrowCount) { i in
                    ArrowShape()
                        .stroke(
                            style: StrokeStyle(
                                lineWidth: CGFloat(1),
                                lineCap: .round,
                                lineJoin: .round)
                        )
                        .foregroundColor(Color.white)
                        .aspectRatio(Constants.Slider.Arrows.arrowSize, contentMode: .fit)
                        .frame(maxWidth: Constants.Slider.Arrows.arrowSize.width)
                        .opacity(self.fade)
                        .scaleEffect(self.scale)
                        .animation(
                            Animation.easeOut(duration: Constants.Slider.Arrows.animationDuration)
                                .repeatCount(1, autoreverses: true)
                                .delay(Constants.Slider.Arrows.animationDelay * Double(i))
                        )
                }.onReceive(self.timer) { _ in
                    self.scale = self.scale > Constants.Slider.Arrows.scaleInitial ?
                    Constants.Slider.Arrows.scaleInitial :
                    Constants.Slider.Arrows.scaleFinal
                    self.fade = self.fade > Constants.Slider.Arrows.fadeInitial ?
                    Constants.Slider.Arrows.fadeInitial :
                    Constants.Slider.Arrows.fadeFinal
                    DispatchQueue.main.asyncAfter(deadline: .now() + Constants.Slider.Arrows.animationDuration) {
                        self.scale = Constants.Slider.Arrows.scaleInitial
                        self.fade = Constants.Slider.Arrows.fadeInitial
                    }
                }
            }
        }
    }
}

struct ArrowShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.size.width, y: rect.size.height/2.0))
        path.addLine(to: CGPoint(x: 0, y: rect.size.height))
        
        return path
    }
}
