//
//  SearchLoadedContentView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 27.01.2026.
//

import SwiftUI

struct SearchLoadedContentView: View {
    
    @Binding var searchText: String
    @Binding var isEditing: Bool
    
    @State var searchResults: [SearchMultiContentResult] = []
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            ZStack {
                VStack {
                    Rectangle()
                        .frame(height: 120.0)
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(Color("VibrantBlue"))
                    
                    Spacer()
                }
                
                HStack {
                    TextField("Movies or Series", text: $searchText)
                        .padding(7)
                        .padding(.horizontal, 25)
                        .background(Color.white)
                        .font(Font.system(size: 17))
                        .cornerRadius(8)
                        .overlay(
                            HStack {
                                Image("iconMiniSearch")
                                    .foregroundColor(.gray)
                                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                    .padding(.leading, 8)
                                
                                if isEditing {
                                    Button(action: {
                                        searchText = ""
                                        searchResults.removeAll()
                                    }) {
                                        if searchText != "" {
                                            Image(systemName: "multiply.circle.fill")
                                                .foregroundColor(.black)
                                                .padding(.trailing, 8)
                                        }
                                    }
                                }
                            }
                        )
                        .onTapGesture {
                            isEditing = true
                        }
                    
                    if isEditing {
                        Button(action: {
                            isEditing = false
                            searchText = ""
                            searchResults.removeAll()
                            
                            UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
                        }) {
                            Text("Cancel")
                                .fontWeight(.regular)
                                .font(Font.system(size: 17))
                                .background(Color.clear)
                                .foregroundColor(Color.white)
                                .frame(height: 20)
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 36)
                .background(Color.clear)
                .padding(.top, -30)
                .padding(.horizontal, 24)
            }
            
            // TODO: - Put the cards when user is searching contents -
            if !searchResults.isEmpty {
                ForEach(searchResults, id: \.self) { result in
                    SearchCardView(searchResult: result)
                }
            } else {
                if isEditing && !searchText.isEmpty && searchText.count > 3 {
                    Image("emptySearch")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 220, height: 123)
                }
            }
            
        }
    }
}

