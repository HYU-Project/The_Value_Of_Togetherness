//
//  DetailPostModel.swift
//  hkkim_front
//
//  Created by 김소민 on 12/30/24.
//

import Foundation
import FirebaseFirestore

// 게시물
struct PostInfo: Identifiable, Codable {
    @DocumentID var id: String? // post_idx
    let user_idx: String
    let post_category: String
    let post_categoryType: String
    let title: String
    let post_content: String
    let location: String
    let want_num: Int
    let post_status: String
    @ServerTimestamp var created_at: Date? // Firestore Timestamp 자동 변환
    let school_idx: String
    var images: [PostImages]? // 서브컬렉션 postImages
}

extension PostInfo {
    func toCreatePost() -> CreatePost {
        let convertedImages = (self.images ?? []).map {
                    CreatePostImage(post_idx: $0.post_idx, image_url: $0.image_url, order: $0.order)
                }
        print("Converted Images: \(convertedImages)")
        
        return CreatePost(
            post_idx: self.id,
            user_idx: self.user_idx,
            post_category: self.post_category,
            post_categoryType: self.post_categoryType,
            title: self.title,
            post_content: self.post_content,
            location: self.location,
            want_num: self.want_num,
            post_status: self.post_status,
            created_at: self.created_at ?? Date(),
            school_idx: self.school_idx,
            postImages: convertedImages
        )
    }
}

// 게시물 이미지
struct PostImages: Identifiable, Codable {
    @DocumentID var id: String? // Firestore의 문서 ID
    let post_idx: String
    let image_url: String
    let order: Int
}

// 유저
struct UserProperty : Identifiable, Codable {
    var id: String {user_idx}
    let user_idx: String
    let name: String
    let profile_image_url: String?
}

// 댓글
struct Comments : Identifiable, Codable{
    var id: String { comment_idx } // documentID로
    let comment_idx: String
    let user_idx: String
    let post_idx: String
    var comment_content: String
    var comment_created_at: Date
    var replies: [Replies]?
    var user_name: String? = nil       // 작성자 이름
    var profile_image_url: String? = nil // 작성자 프로필 이미지 URL
}

// 대댓글
struct Replies : Identifiable, Codable{
    var id: String { reply_idx } // document ID로
    let reply_idx: String
    let user_idx: String
    let comment_idx: String
    var reply_content: String
    var reply_created_at: Date
    var user_name: String? = nil       // 작성자 이름
    var profile_image_url: String? = nil // 작성자 프로필 이미지 URL
}



