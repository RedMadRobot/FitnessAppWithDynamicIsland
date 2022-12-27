//
//  CustomViewModifiers.swift
//  DynamicInslandAppExtension
//
//  Created by Anna Kocheshkova on 29.10.2022.
//

import Foundation
import SwiftUI

struct BlackSubTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18))
            .foregroundColor(.black)
    }
}

struct SubTitle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16))
            .opacity(0.6)
            .foregroundColor(.white)
    }
}

struct Title: ViewModifier {
    
    let size: CGFloat
    
    func body(content: Content) -> some View {
        content
            .bold()
            .font(.custom("FugazOne-Regular", size: size))
            .foregroundColor(.white)
    }
}

extension View {
    func subtitle() -> some View {
        modifier(SubTitle())
    }
    func blackSubtitle() -> some View {
        modifier(BlackSubTitle())
    }
    
    func title(size: CGFloat = 24) -> some View {
        modifier(Title(size: size))
    }
}

struct CenteredLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack(spacing: 6) {
            configuration.icon.frame(width: 16, height: 16)
            configuration.title
        }
    }
}

struct LinkButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label.overlay {
            if configuration.isPressed {
                Color.black.opacity(Constants.FitnessList.rowPressedOverlayOpacity)
            }
        }
    }
}
