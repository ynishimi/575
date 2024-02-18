//
//  SignUpView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

import SwiftUI
import FirebaseAuth
import FirebaseCore
import FirebaseFirestore
import FirebaseFirestoreSwift

struct SignUpView: View {
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
//    @State var uid: String = ""
    @EnvironmentObject var userAuth: UserAuth

    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    InputView(text: $username,
                              title: "User Name",
                              placeholder: "Username")
                        .keyboardType(.emailAddress)
                        .textContentType(.emailAddress)
                        .disableAutocorrection(true)
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
                        signup()
                    }
                    .disabled(email.isEmpty || password.isEmpty)
                    .fontWeight(.bold)
                }
            }
            .navigationTitle("Sign Up")
        }
    }
    
    private func signup() {
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if result?.user != nil {
//                作成成功
                print("Created a user")
//                print(result?.user)
                userAuth.update()
            }
        }
    }
//        ユーザデータを作成
    private func storeUser() {
//        if let user = Auth.auth().currentUser {
//            uid = user.uid
//        }
        let currentUser = userAuth.user
        if currentUser != nil {
            Firestore.firestore().collection("users")
                .document(currentUser!.uid)
                .setData(
                  [
                    "uid": currentUser!.uid,
                    "username": username,
                    "imageUrl": "",
                    "createdAt": FieldValue.serverTimestamp(),
                    "updatedAt": FieldValue.serverTimestamp(),
                  ]
                )
        }
    }
}

#Preview {
    SignUpView()
}
