//
//  ControlView.swift
//  NationalGeography
//
//  Created by Asalah Sayed on 29/07/2023.
//

import SwiftUI

struct ControlView: View {
    // Properties
    @Binding var imageScale: CGFloat
    @Binding var imageOffset: CGSize
    // Body
    var body: some View {
        HStack{
            Button {
                // Action to minimize The Picture
                if imageScale > 1{
                    imageScale = imageScale - 1
                }
            } label: {
                Image(systemName: "minus.magnifyingglass")
            }
            Button {
                // Action to reset The Picture
                imageScale = 1
                imageOffset = .zero
            } label: {
                Image(systemName: "arrow.up.left.and.down.right.magnifyingglass")
            }
            Button {
                // Action to Maximize The Picture
                if imageScale < 5{
                    imageScale += imageScale
                }
            } label: {
                Image(systemName: "plus.magnifyingglass")
            }

        } //: HStack
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .foregroundColor(.white)
        .background(.ultraThinMaterial)
        .cornerRadius(20)
        .font(.largeTitle)
    }
}

struct ControlView_Previews: PreviewProvider {
    static var previews: some View {
        ControlView(imageScale: .constant(1), imageOffset: .constant(.zero)).previewLayout(.sizeThatFits)
            .preferredColorScheme(.dark)
    }
}
