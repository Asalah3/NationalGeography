//
//  ContentView.swift
//  NationalGeography
//
//  Created by Asalah Sayed on 27/07/2023.
//

import SwiftUI

struct ContentView: View {
    //Propreties
    @State var imageScale: CGFloat = 1
    @State var imageOffset: CGSize = .zero
    let covers: [Cover] = coverData
    @State var coverIndex: Int = 1
    //Function
    private func resetImage(){
        imageScale = 1
        imageOffset = .zero
    }
    //Body
    var body: some View {
        Image(covers[coverIndex].coverName)
            .resizable()
            .scaledToFit()
            .cornerRadius(10)
            .padding()
            .scaleEffect(imageScale)
            .offset(x: imageOffset.width, y: imageOffset.height)
            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.35), radius: 8, x: 3, y: 3)
        //Drawer
            .overlay(alignment: .topTrailing){
                DrawerView( index: $coverIndex)
                    .padding(.top, 15)
                // Control View
            }.overlay(alignment: .bottom){
                ControlView(imageScale: $imageScale, imageOffset: $imageOffset)
                    .padding(.top, 15)
            }.overlay(alignment: .top){
                PannelView(scale: imageScale, offset: imageOffset)
                    .padding()
                    .offset(y:-50)
            }
        

        //1.Double Tab Geature
            .onTapGesture(count: 2) {
                withAnimation(.spring()){
                    if imageScale == 1{
                        imageScale = 5
                    }else{
                        resetImage()
                    }
                }
            }
        
        //2.Drag Geature
            .gesture(DragGesture()
                .onChanged({ gesture in
                    imageOffset = gesture.translation
                }).onEnded({ _ in
                    withAnimation(.spring()){
                        if imageScale <= 1{
                            resetImage()
                        }
                    }
                })
            )
        //3.Magnification Geature
            .gesture(MagnificationGesture()
                .onChanged({ value in
                    withAnimation(.spring()){
                        if imageScale >= 1 && imageScale <= 5{
                            imageScale = value
                        }else if imageScale > 5 {
                            imageScale = 5
                        }else if imageScale < 1 {
                            imageScale = 1
                        }
                    }
                })
                    .onEnded({ _ in
                        withAnimation(.spring()){
                            if imageScale > 5 {
                                imageScale = 5
                            }else if imageScale < 1 {
                                imageScale = 1
                            }
                        }
                    })
            )
            
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().preferredColorScheme(.dark)
    }
}
