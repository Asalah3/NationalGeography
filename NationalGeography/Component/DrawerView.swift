//
//  DrawerView.swift
//  NationalGeography
//
//  Created by Asalah Sayed on 27/07/2023.
//

import SwiftUI

struct DrawerView: View {
    //Properties
    let covers : [Cover] = coverData
    @State var isDrawerOpen: Bool = false
    @Binding var index: Int
    var body: some View {
        HStack{
            Image(systemName: isDrawerOpen ? "chevron.compact.right" : "chevron.compact.left")
                .resizable()
                .scaledToFit()
                .frame(height: 40, alignment: .center)
                .padding(.leading, 2)
                .foregroundColor(.secondary)
                .onTapGesture {
                    withAnimation(.spring()){
                        isDrawerOpen.toggle()
                    }
                }
            Spacer()
            ForEach(covers) { item in
                Image(item.thumbnail)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120, alignment: .center)
                .padding(.horizontal, 2)
                .onTapGesture {
                    index = item.id - 1
                }
            }
        }//:HStack
        .padding(.horizontal, 4)
        .frame(width: 260)
        .background(.thinMaterial)
        .cornerRadius(8)
        .offset(x: isDrawerOpen ? 0 : 235)
        
    }
}

struct DrawerView_Previews: PreviewProvider {
    static var previews: some View {
        DrawerView(index: .constant(0))
            .previewLayout(.sizeThatFits)
    }
}
