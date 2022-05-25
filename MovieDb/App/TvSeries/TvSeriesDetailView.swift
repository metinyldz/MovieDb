//
//  TvSeriesDetailView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 14.05.2022.
//

import SwiftUI

struct TvSeriesDetailView: View {
    
    //MARK: - PROPERTIES -
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ScrollView {
            
            //MARK: - HEADER -
            
            VStack {
                ZStack {
                    Image("moviePlaceholder")
                        .resizable()
                        .scaledToFill()
                        .frame(maxWidth: .infinity, maxHeight: 400)
                        .clipped()
                        .padding(.top, -50)
                    
                    VStack {
                        HStack {
                            Image(systemName: "arrow.left")
                                .foregroundColor(Color.white)
                                .frame(width: 25, height: 25)
                                .onTapGesture {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                                .padding([.leading, .trailing], 24)
                            
                            Spacer()
                        } //: HStack
                        .frame(maxWidth: .infinity, maxHeight: 50)
                        
                        Spacer()
                    } //: VStack
                } //: ZStack
                
                //MARK: - CENTER -
                
                TvSeriesDetailCenterView()
                    .padding(.top, -24)
                
                //MARK: - FOOTER -
                
                TvSeriesDetailFooterView()
                
            } //: VStack
        } //: SCROLL
        .background(Color("BackgroundColor"))
//        .edgesIgnoringSafeArea(.all)
        .navigationBarHidden(true)
    }
}

struct TvSeriesDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailView()
    }
}
