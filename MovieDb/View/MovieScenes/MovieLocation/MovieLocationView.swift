//
//  MovieLocationView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 28.05.2022.
//

import SwiftUI
import MapKit

struct MovieLocationView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack {
                ZStack {
                    Rectangle()
                        .frame(height: 60)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(Color("VibrantBlue"))
                    
                    HStack {
                        Image(systemName: "arrow.left")
                            .resizable()
                            .foregroundColor(Color.white)
                            .scaledToFit()
                            .frame(width: 25, height: 25)
                            .onTapGesture {
                                self.presentationMode.wrappedValue.dismiss()
                            }
                            .padding(.leading, 24)
                            .padding(.trailing, 20)
                        
                        Text("Cinema")
                            .foregroundColor(Color.white)
                            .font(Font.system(size: 25))
                            .fontWeight(.bold)
                        
                        
                        Spacer()
                    }
                }
                .frame(height: 60)

                Map(coordinateRegion: $region, showsUserLocation: true, userTrackingMode: .constant(.follow))
                    .ignoresSafeArea(edges: .vertical)
                    .padding(.top, -8)
                
            }
            .navigationBarHidden(true)
            .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
        }
    }
}

#Preview {
    MovieLocationView()
}
