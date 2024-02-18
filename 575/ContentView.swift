//
//  ContentView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
    private var view: Bool = false
    @EnvironmentObject var userAuth: UserAuth
    var body: some View {
        Group {
        if Auth.auth().currentUser != nil {
//            if (view) {
                PostView()
            }
            else {
                LoginView()
            }
        }
    }
}

//  ログイン状況を管理する。@EnvironmentObjectを使う。
class UserAuth: ObservableObject {
//    @Published var isLoggedIn: Bool = false
    @Published var user: User?

    init() {
        self.user = Auth.auth().currentUser
    }
    func update() {
        self.user = Auth.auth().currentUser
    }
}

//    func logout() {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("logout failed")
//        }
//    }

#Preview {
    ContentView()
}
