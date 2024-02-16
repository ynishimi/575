//
//  ContentView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

import SwiftUI
import FirebaseAuth

struct ContentView: View {
//    UserAuthクラス
//    @EnvironmentObject var userAuth: UserAuth
    
    var body: some View {
        Group {
        if Auth.auth().currentUser != nil {
                PostView()
            }
            else {
                LoginView()
            }
        }
    }
}

//  ログイン状況を管理する。@EnvironmentObjectを使う。
//class UserAuth: ObservableObject {
//    @Published var isLoggedIn: Bool = false
//    @Published var user: User?
//    
//    init() {
//        Auth.auth().addStateDidChangeListener { (Auth, User) in
//            self.isLoggedIn = User != nil
//            self.user = User
//        }
//    }
//    
//    func logout() {
//        do {
//            try Auth.auth().signOut()
//        } catch {
//            print("logout failed")
//        }
//    }
//}

#Preview {
    ContentView()
}
