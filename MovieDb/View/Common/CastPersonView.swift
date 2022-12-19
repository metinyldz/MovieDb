//
//  CastPersonView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 19.06.2022.
//

import SwiftUI

struct CastPersonView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var castPeople: CastPeopleModel?
    
    var body: some View {
        ScrollView {
            if let castPeople = castPeople {
                //MARK: - HEADER -
                
                VStack {
                    ZStack {
                        AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(castPeople.profile_path ?? "")")) { image in
                            image
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 400)
                                .clipped()
                                .padding(.top, -50)
                        } placeholder: {
                            Image("moviePlaceholder")
                                .resizable()
                                .scaledToFill()
                                .frame(maxWidth: .infinity, maxHeight: 400)
                                .clipped()
                                .padding(.top, -50)
                        }
                        
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
                    
                    Text(castPeople.name ?? "")
                        .fontWeight(.bold)
                        .font(.system(size: 28))
                        .frame(height: 34)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.horizontal, 24)
                        .padding(.top, 20)
                    
                    Text(castPeople.biography ?? "-")
                        .fontWeight(.regular)
                        .font(.system(size: 17))
                        .opacity(0.8)
                        .foregroundColor(.black)
                        .padding(.horizontal, 24)
                    
                    //MARK: - FOOTER -
                    
                    HStack {
                        Text("Born: ")
                            .fontWeight(.bold)
                            .font(.system(size: 17))
                            .opacity(0.8)
                            .foregroundColor(.black)
                        
                        Text(castPeople.place_of_birth ?? "-")
                            .fontWeight(.regular)
                            .font(.system(size: 17))
                            .opacity(0.8)
                            .foregroundColor(.black)
                    }
                    .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
                    .padding(.horizontal, 24)
                } //: VStack
                .padding(.bottom, 10)
                
            }
        } //: SCROLL
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
    }
}

struct CastPersonView_Previews: PreviewProvider {
    static var previews: some View {
        CastPersonView()
    }
}
