//
//  PostList.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/14.
//

import SwiftUI
import FirebaseFirestoreSwift

struct PostList: View {
    @FirestoreQuery(collectionPath: "posts") var posts: [Post]
    var body: some View {
        List {
            ForEach(posts) {post in
                Text(posts.description)
            }
        }
    }
}

#Preview {
    PostList()
}
