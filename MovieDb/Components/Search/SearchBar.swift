//
//  SearchBar.swift
//  MovieDb
//
//  Created by Metin Yıldız on 22.05.2022.
//

import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isEditing = false
    
    var body: some View {
        HStack {
            withAnimation {
                TextField("Movies or Series", text: $text)
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
                                    self.text = ""
                                }) {
                                    if text != "" {
                                        Image(systemName: "multiply.circle.fill")
                                            .foregroundColor(.black)
                                            .padding(.trailing, 8)
                                    }
                                }
                            }
                        }
                    )
                    .onTapGesture {
                        self.isEditing = true
                    }
            }
            
            if isEditing {
                withAnimation {
                    Button(action: {
                        self.isEditing = false
                        self.text = ""
                        
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
                    //                .animation(.default)
                }
            } //: BUTTON
        } //: HSTACK
        .frame(maxWidth: .infinity, maxHeight: 36)
        .background(Color.clear)
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .previewLayout(.fixed(width: 375, height: 36))
    }
}
