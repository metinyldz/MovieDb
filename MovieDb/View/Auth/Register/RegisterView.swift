//
//  RegisterView.swift
//  MovieDb
//
//  Created by Metin Yıldız on 21.04.2023.
//

import SwiftUI

struct RegisterView: View {
    enum FocusedField: Hashable {
        case firstName, lastName, email
    }
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @FocusState private var focusedField: FocusedField?
    
    var body: some View {
        NavigationView {
            VStack {
                VStack {
                    Section {
                        TextField("First Name", text: $firstName)
                            .padding()
                            .frame(height: 45)
                            .font(.body)
                            .background(Color.gray.opacity(0.1).cornerRadius(10.0))
                            .focused($focusedField, equals: .firstName)
                    }
                    
                    Section {
                        TextField("Last Name", text: $firstName)
                            .padding()
                            .frame(height: 45)
                            .font(.body)
                            .background(Color.gray.opacity(0.1).cornerRadius(10.0))
                            .focused($focusedField, equals: .lastName)
                    }
                    
                    Section {
                        TextField("Email", text: $email)
                            .padding()
                            .frame(height: 45)
                            .font(.body)
                            .background(Color.gray.opacity(0.1).cornerRadius(10.0))
                            .focused($focusedField, equals: .email)
                    }
                }
                .padding()
                .onAppear {
                    UITableView.appearance().backgroundColor = .clear
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        focusedField = .firstName
                    }
                }
                .onDisappear {
                    UITableView.appearance().backgroundColor = .systemGroupedBackground
                }
                
                Button {
                    // TODO: Add action
                } label: {
                    Text("Sign in")
                        .frame(width: 150, height: 50)
                        .font(.body)
                        .foregroundColor(Color.white)
                        .background(Color.blue.cornerRadius(10))
                }

            }
            .navigationBarTitle("Register", displayMode: .large)
            .navigationViewStyle(.stack)
            .navigationBarColor(backgroundColor: Color("VibrantBlue"), titleColor: .white)
        }
    }
}

#Preview {
    RegisterView()
}
