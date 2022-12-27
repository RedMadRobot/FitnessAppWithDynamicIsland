import SwiftUI

struct SliderView: View {
    
    var thumbWidth: CGFloat = Constants.Slider.thumbWidth
    var foreground = Constants.Slider.sliderForegroundColor
    var background = Constants.Slider.sliderBackgroundColor
    var sliderRange: ClosedRange<Double> = 0...100
    @Binding var value: Double
    @Binding var dragEnded: Bool
    @State var showFinal: Bool = false
    @State var lastCoordinateValue: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { gr in
            let height = gr.size.height
            let radius = gr.size.height * 0.5
            let minValue = gr.size.width * 0.015
            let maxValue = (gr.size.width * 0.98) - thumbWidth
            let textPosition = (gr.size.width - thumbWidth) / 2
            let textOffset = textPosition / 2 - 16
            let scaleFactor = (maxValue - minValue) / (sliderRange.upperBound - sliderRange.lowerBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor + minValue
            let firstTextOffset = (thumbWidth + sliderVal) / 2 - 15
            let goOpacity = 1 - (sliderVal / Constants.Slider.thumbTextFadeDistance)
            let opacity = goOpacity < 0 ? 0 : goOpacity
            
            ZStack {
                RoundedRectangle(cornerRadius: radius)
                    .foregroundColor(background).zIndex(2)
                HStack {
                    Text(Constants.Slider.thumbText).blackSubtitle()
                        .opacity(opacity)
                    Spacer()
                }
                .zIndex(6)
                .offset(x: firstTextOffset)
                
                HStack(spacing: 16) {
                    Spacer()
                    Text(Constants.Slider.startText).subtitle()
                    Arrows()
                }
                .zIndex(4)
                .offset(x: -1 * textOffset)
                .opacity(opacity)
                
                VStack(alignment: .center) {
                    Text(Constants.Slider.finalText).blackSubtitle()
                        .opacity(showFinal ? 1 : 0)
                }
                .zIndex(6)
                
                HStack {
                    RoundedRectangle(cornerRadius: height)
                        .foregroundColor(foreground)
                        .frame(width: thumbWidth + sliderVal, height: height)
                        .gesture(
                            DragGesture(minimumDistance: 0)
                                .onChanged { v in
                                    if (abs(v.translation.width) < 0.1) {
                                        self.lastCoordinateValue = sliderVal
                                    }
                                    if v.translation.width > 0 {
                                        let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor)  + lower
                                    } else {
                                        let nextCoordinateValue = max(minValue, self.lastCoordinateValue + v.translation.width)
                                        self.value = ((nextCoordinateValue - minValue) / scaleFactor) + lower
                                    }
                                    
                                }.onEnded { v in
                                    guard value == sliderRange.upperBound else {
                                        withAnimation(Constants.Slider.bounceBackAnimation) {
                                            self.value = sliderRange.lowerBound
                                        }
                                        return
                                    }
                                    withAnimation(Constants.Slider.dragEndedAnimation) {
                                        self.showFinal = true
                                        self.dragEnded = true
                                    }
                                }
                        )
                    Spacer()
                }
                .zIndex(5)
            }
        }
    }
}

