//
//  CirclePhotoView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct CirclePhotoView: View {
    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .fill(.gray)
                    .frame(width: 70, height: 70)
            } //: ZSTACK
            
            Text("Emilia Clarke")
        } //: VSTACK
    }
}

struct CircleFotoView_Previews: PreviewProvider {
    static var previews: some View {
        CirclePhotoView()
            .previewLayout(.sizeThatFits)
    }
}
