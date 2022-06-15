//
//  TvSeriesDetailFooterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct TvSeriesDetailFooterView: View {
    
    var content: TvSerieDetailModel
    var seasonNumber: Int = 0
    @State var isCreatorsEmpty: Bool = false
    
    var body: some View {
        VStack {
            Text(content.overview ?? "-")
                .font(Font.system(size: 17))
                .fontWeight(.regular)
                .foregroundColor(Color.black)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 24)
            
            VStack {
                ZStack {
                    Capsule()
                        .fill(Color(.sRGB, red: 57/255, green: 58/255, blue: 59/255))

                    Text("\(content.number_of_seasons ?? 0) Seasons")
                        .foregroundColor(.white)
                        .font(Font.system(size: 12))
                        .fontWeight(.black)
                        .frame(maxWidth: .infinity, maxHeight: 14)
                } //: ZSTACK
                .frame(width: 81, height: 24)
            } //: VSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, 24)
            
            if isCreatorsEmpty {
                HStack {
                    Text("Creators: ")
                        .font(Font.system(size: 17))
                        .fontWeight(.regular)
                        .foregroundColor(Color.black)
                    
                    ForEach(content.created_by!, id: \.id) { item in
                        let comma = (content.created_by?.last?.id == item.id) ? "" : ", "
                        HStack {
                            Text("\(item.name ?? "")\(comma)")
                                .font(Font.system(size: 17))
                                .fontWeight(.semibold)
                                .lineLimit(nil)
                                .foregroundColor(Color("VibrantBlue"))
                        }
                    }

                    Spacer()
                } //: HSTACK
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.vertical, 20)
                .padding(.horizontal, 24)
            }
            
            VStack {
                
                // TODO: - Cast kısmını yap. -
                
                Text("Cast")
                    .font(Font.system(size: 28))
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 24)

                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(1...7, id: \.self) { _ in
                            CirclePhotoView()
                        } //: FOREACH
                    } //: HSTACK
                } //: SCROLL
                .edgesIgnoringSafeArea(.horizontal)
                .frame(maxWidth: .infinity, maxHeight: 100)
                .padding(.bottom, 21)
            } //: VSTACK
            .frame(maxWidth: .infinity, alignment: .leading)
        } //: VSTACK
        .onAppear {
            checkCreators()
        }
        
    }
    
    private func checkCreators() {
        if let created_by = content.created_by {
            if !created_by.isEmpty {
                isCreatorsEmpty = true
            } else {
                isCreatorsEmpty = false
            }
        } else {
            isCreatorsEmpty = false
        }
//        if let created_by = content.created_by {
//            if !created_by.isEmpty {
//                HStack {
//                    Text("Creators:")
//                        .font(.body)
//                        .lineLimit(1)
//
//                    ForEach(created_by, id: \.id) { item in
//                        HStack {
//                            Text("\(item.name ?? "") ")
//                                .font(.headline)
//                                .foregroundColor(Color("VibrantBlue"))
//                                .lineLimit(nil)
//                        }
//                    }
//                }
//                .padding(.leading, 24)
//                .padding(.top, 15)
//            }
//        }
    }
}

struct TvSeriesDetailFooterView_Previews: PreviewProvider {
    static var previews: some View {
        TvSeriesDetailFooterView(content: TvSerieDetailModel.all())
            .previewLayout(.sizeThatFits)
    }
}
