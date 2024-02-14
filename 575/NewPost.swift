//
//  NewPost.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/15.
//

import SwiftUI
import Firebase

struct NewPost: View {
    @State var newPost: Post = Post(user: "", post1: "", post2: "", post3: "", description: "")
    @Environment(\.dismiss) var dismiss
    
    func addPost(post: Post) {
        let db = Firestore.firestore()
        let collectionRef = db.collection("posts")
        do {
            let newDocReference = try collectionRef.addDocument(from: self.newPost)
            print("Book stored with new document reference: \(newDocReference)")
        }
        catch {
            print(error)
        }
    }
    
    var body: some View {

        VStack {
            TextField("5", text: $newPost.post1)
                .padding(.all)
            TextField("7", text: $newPost.post2)
                .padding(.all)
            TextField("5", text: $newPost.post3)
                .padding(.all)
            Button("Post") {
                addPost(post: newPost)
                dismiss()
            }
        }.navigationTitle("New Post")
    }
}

#Preview {
    NewPost()
}
