//
//  NewPostView.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/15.
//

import SwiftUI
import Firebase

struct NewPost: View {
    @State var newPost: Post = Post(user: "", post1: "", post2: "", post3: "", description: "")
    @FocusState private var post1IsFocused: Bool
    @FocusState private var post2IsFocused: Bool
    @FocusState private var post3IsFocused: Bool
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Section {
                        TextField("5", text: $newPost.post1)
                            .focused($post1IsFocused)
                            .onSubmit {
    //                            validate
                            }
                        TextField("7", text: $newPost.post2)
                            .focused($post2IsFocused)
                        TextField("5", text: $newPost.post3)
                            .focused($post3IsFocused)
                    }
                    Section {
                        Button("Post") {
                            addPost(post: newPost)
                            dismiss()
                        }.disabled(newPost.post1.isEmpty || newPost.post2.isEmpty || newPost.post3.isEmpty)
                    }
                }
                .navigationTitle("New Post")
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
