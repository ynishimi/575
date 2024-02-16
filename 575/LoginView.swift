//
//  LoginView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var loginSuccess: Bool = false
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    InputView(text: $email,
                              title: "Email Address",
                              placeholder: "name@example.com")
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        
                    InputView(text: $password,
                              title: "Password",
                              placeholder: "Password",
                              isSecureField: true)
                               
                    Button("Login") {
                        login()
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .fontWeight(.bold)
                    .fontWeight(.bold)
                    .navigationDestination(isPresented: $loginSuccess) {
                        PostView()
                    }
                    
                    //NavigationLink
                    NavigationLink {
                        SignUpView()
                    }   label: {
                        Text("Don't have an account?")
                        Text("Sign up")
                            .fontWeight(.bold)
                        }
                    .navigationTitle("Log In")
                    .navigationBarBackButtonHidden(true)
                }
            }
        }
    }
    
    private func login() {
        Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
            if error != nil {
                print("login failed")
            } else {
                print("login suceeded")
                loginSuccess = true
            }
        }
    }
}

#Preview {
    LoginView()
}
