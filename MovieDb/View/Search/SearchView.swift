//
//  SearchView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 17.05.2022.
//

import SwiftUI

struct SearchView: View {
    
    @StateObject var searchViewModel = SearchViewModel()
    @State var searchText = ""
    @State var searchResults = [SearchMultiContentResult]()
    @State var isActive: Bool = false
    @State private var isEditing = false
    
    var body: some View {
        NavigationView {
            ZStack {
                Color("BackgroundColor")
                    .ignoresSafeArea(.all, edges: .all)
                
                ScrollView(showsIndicators: false) {
                    //MARK: - HEADER -
                    
                    ZStack {
                        VStack {
                            Rectangle()
                                .frame(height: 120.0)
                                .frame(minWidth: 0, maxWidth: .infinity)
                            .foregroundColor(Color("VibrantBlue"))
                            
                            Spacer()
                        } //: VStack
                        
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
                                .animation(.default)
                            
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
                                .animation(.default)
                            } //: BUTTON
                        } //: HSTACK
                        .frame(maxWidth: .infinity, maxHeight: 36)
                        .background(Color.clear)
                        .padding(.top, -30)
                        .padding(.horizontal, 24)
                        
//                        SearchBar(text: $searchText)

                    } //: ZSTACK
                    
                    //MARK: - CENTER -
                    
                    // TODO: - Arama yapıldığında Kartları koy buraya. -
                    if !searchResults.isEmpty {
                        ForEach(searchResults, id: \.self) { result in
                            //NavigationLink(destination: MovieDetailView(), isActive: $isActive) {
                            SearchCardView(searchResult: result)
                            //} //: LINK
                        }
                    } else {
                        if isEditing && !searchText.isEmpty && searchText.count > 3 {
                            Image("emptySearch")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 220, height: 123)
                        }
                    }
                    
                } //: SCROLL
                .navigationBarTitle("Search", displayMode: .large)
                .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
            } //: ZSTACK
        } //: NAVIGATION
        .onChange(of: searchText) { text in
            if !text.isEmpty && text.count > 3 {
                sendContentRequest()
            }
        }
    }
    
    private func sendContentRequest() {
        if searchText != "" {
            searchViewModel.fetchSearchContent(queryString: searchText) { result, success in
                guard let result = result else { return }
                isEditing = !result.results.isEmpty
                searchResults = result.results
            }
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
