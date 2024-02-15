//
//  LoginView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

import SwiftUI

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                        .autocapitalization(.none)
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Password",
                              isSecureField: true)

                    Button("Log In") {
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .fontWeight(.bold)
                    
                    //NavigationLink
                    NavigationLink {
                        SignUpView()
                    }   label: {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                        }
                    .navigationTitle("Log In")
                }
            }
        }
    }
}

#Preview {
    LoginView()
}
