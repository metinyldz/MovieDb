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
                VStack {
                    //MARK: - HEADER -
                    CastPersonHeaderView(presentationMode: _presentationMode, castPeople: castPeople)
                    
                    //MARK: - CENTER -
                    CastPersonCenterView(castPeople: castPeople)
                    
                    //MARK: - FOOTER -
                    
                    CastPersonFooterView(castPeople: castPeople)
                } //: VStack
            }
        } //: SCROLL
        .background(Color("BackgroundColor"))
        .navigationBarHidden(true)
    }
}

struct CastPersonHeaderView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    var castPeople: CastPeopleModel?
    
    var body: some View {
        ZStack {
            GeometryReader { proxy in
                let global = proxy.frame(in: .global)
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500\(castPeople?.profile_path ?? "")")) { image in
                    image
                        .resizable()
                        .offset(y: global.minY > 0 ? -global.minY : 0)
                        .frame(height: global.minY > 0 ? (UIScreen.main.bounds.height/2.2) + global.minY :  UIScreen.main.bounds.height/2.2)
                } placeholder: {
                    Image("moviePlaceholder")
                        .resizable()
                        .offset(y: global.minY > 0 ? -global.minY : 0)
                        .frame(height: global.minY > 0 ? (UIScreen.main.bounds.height/2.2) + global.minY :  UIScreen.main.bounds.height/2.2)
                }
            }
            .frame(height: UIScreen.main.bounds.height/2.2)
            .padding(.bottom, 10)
            
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
    }
}

struct CastPersonCenterView: View {
    var castPeople: CastPeopleModel?
    
    var body: some View {
        Text(castPeople?.name ?? "")
            .fontWeight(.bold)
            .font(.system(size: 28))
            .frame(height: 34)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            .padding(.top, 20)
        
        Text(castPeople?.biography ?? "-")
            .fontWeight(.regular)
            .font(.system(size: 17))
            .opacity(0.8)
            .foregroundColor(.black)
            .padding(.horizontal, 24)
    }
}

struct CastPersonFooterView: View {
    var castPeople: CastPeopleModel?
    
    var body: some View {
        HStack {
            Text("Born: ")
                .fontWeight(.bold)
                .font(.system(size: 17))
                .opacity(0.8)
                .foregroundColor(.black)
            
            Text(castPeople?.place_of_birth ?? "-")
                .fontWeight(.regular)
                .font(.system(size: 17))
                .opacity(0.8)
                .foregroundColor(.black)
        }
        .frame(maxWidth: .infinity, maxHeight: 24, alignment: .leading)
        .padding(.horizontal, 24)
    }
}

struct CastPersonView_Previews: PreviewProvider {
    static var previews: some View {
        CastPersonView(castPeople: CastPeopleModel.all())
    }
}
