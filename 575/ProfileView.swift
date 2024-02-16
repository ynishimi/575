//
//  ProfileView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/16.
//

import SwiftUI

struct ProfileView: View {
//    @State var name: String
    var body: some View {
        List {
            Section {
                HStack {
                    Text("MJ")
                        .font(.title)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 72, height: 72)
                        .background(Color(.systemGray))
                    .clipShape(Circle())
                    
                    VStack {
                        Text("Michael Jordan")
                            .fontWeight(.semibold)
                        Text("text@example.com")
                            .font(.footnote)
                    }
                }
            }
            Section("General") {
                Section {
                    Text("hoge")
                }
            }
            Section("Account") {
                
            }
        }
    }
}

#Preview {
    ProfileView()
}
