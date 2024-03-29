//
//  ContentView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/14.
//

import SwiftUI
import FirebaseFirestoreSwift

struct ContentView: View {
    @FirestoreQuery(collectionPath: "posts") var posts: [Post]
    @State private var showingNewPostSheet = false
    
    var body: some View {
        NavigationSplitView {
            List {
                ForEach(posts) {post in
                    HStack{
                        Text(post.post1)
                        Text(post.post2)
                        Text(post.post3)
                    }.font(.body)
                }
            }
            .navigationTitle("575s")
            .toolbar {
                Button {
                    showingNewPostSheet.toggle()
                } label: {
                    Text("Post")
                }
            }
            .sheet(isPresented: $showingNewPostSheet) {
                NewPost()
            }
        } detail: {
            Text("Posts")
        }
    }
}

#Preview {
    ContentView()
}
