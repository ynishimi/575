//
//  InputView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

//  ログイン用のパーツ

import SwiftUI

struct InputView: View {
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSecureField = false
    var body: some View {
            Section {
                if isSecureField {
                    SecureField(placeholder, text: $text)
                     
                } else {
                    TextField(placeholder, text: $text)
                }
            } header: {
                Text(title)
            }

    }
}

#Preview {
    InputView(text: .constant(""), title: "Email Address", placeholder: "name@example.com")
}
