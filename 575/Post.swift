//
//  Post.swift
//  575
//
//  Created by Yuki Nishimi on 2024/02/14.
//

//  投稿のstruct (Post)
import Foundation
import FirebaseFirestoreSwift

struct Post: Codable, Identifiable {
    @DocumentID var id: String?
    var user: String
    var post: String
    var description: String?
}
