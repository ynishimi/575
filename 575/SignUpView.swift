//
//  SignUpView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

import SwiftUI

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    InputView(text: $username,
                              title: "User Name",
                              placeholder: "Username")
                        .autocapitalization(.none)
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    Section {
                        SecureField("Password", text: $confirmPassword)
                        SecureField("Confirm Password", text: $confirmPassword)
                    } header: {
                        Text("Password")
                    }
                    
                    
                    Button("Sign Up") {
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .fontWeight(.bold)
                
                }
            }

        }
    }
        
}

#Preview {
    SignUpView()
}
