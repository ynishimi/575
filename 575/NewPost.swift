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
    
    var body: some View {
        VStack {
            Form {
                Section {
                    TextField("5", text: $newPost.post1)
                    TextField("7", text: $newPost.post2)
                    TextField("5", text: $newPost.post3)
                }
                Section {
                    Button("Post") {
                        addPost(post: newPost)
                        dismiss()
                    }.disabled(newPost.post1.isEmpty || newPost.post2.isEmpty || newPost.post3.isEmpty)
                }
            }

        }
    }
    
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
}

#Preview {
    NewPost()
}
