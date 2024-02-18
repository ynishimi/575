//
//  _75App.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/14.
//

import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct _75App: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
//    var userAuth = UserAuth()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(UserAuth())
        }
    }
}

